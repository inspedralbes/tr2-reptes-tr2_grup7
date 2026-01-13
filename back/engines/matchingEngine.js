import * as db from "../data/db.js";
import { obtenerFiltrosPorModalidad } from '../services/filters/filterManager.js';

export const ejecutarProcesoAsignacion = async () => {
    console.log("⚙️ Iniciando Motor de Asignación ENGINY...");

    try {
        // 1. Obtenemos los talleres que han cerrado su plazo [cite: 36, 43]
        const talleres = await db.query(`
            SELECT id_workshop, title, modalidad, total_capacity, max_students_per_center 
            FROM workshops 
            WHERE request_deadline < NOW() AND status = 'OFFERED'
        `);

        for (const taller of talleres.rows) {
            console.log(`\n📦 Procesando: ${taller.title} (${taller.modalidad})`);
            await asignarAlumnosATaller(taller);
        }

        console.log("\n✅ Proceso de asignación finalizado con éxito.");
    } catch (error) {
        console.error("❌ Error en el matchingEngine:", error);
    }
};

const asignarAlumnosATaller = async (taller) => {
    const { id_workshop, modalidad, total_capacity, max_students_per_center } = taller;

    // 2. LA QUERY MAESTRA: Obtenemos los alumnos y sus datos pedagógicos [cite: 41, 148]
    const result = await db.query(`
        SELECT 
            si.id_interest, si.id_student, si.has_legal_papers, si.created_at,
            s.id_center_assigned, s.eso_grade, s.gender, s.is_at_risk
        FROM student_interest si
        JOIN students s ON si.id_student = s.id_user
        WHERE si.id_workshop = $1 AND si.status = 'WAITING'
    `, [id_workshop]);

    const alumnosCandidatos = result.rows;

    // 3. OBTENER LAS REGLAS: Pedimos al gestor los archivos A, B o C
    const reglas = obtenerFiltrosPorModalidad(modalidad);
    if (!reglas) return;

    // 4. APLICAR FILTROS (Aquí es donde se "pasa" el objeto usuario a tus constantes)
    const alumnosProcesados = alumnosCandidatos
        .map(alumno => {
            // Comprobamos exclusiones (¿cumple edad, papeles, género?) [cite: 32, 158]
            const pasaExclusiones = reglas.exclusiones.every(filtro => filtro(alumno, taller));
            
            if (!pasaExclusiones) return { ...alumno, apto: false, score: -1 };

            // Calculamos puntuación (¿tiene riesgo de absentismo?) [cite: 142, 306]
            const scoreTotal = reglas.prioridades.reduce((acc, filtro) => acc + filtro(alumno, taller), 0);
            
            return { ...alumno, apto: true, score: scoreTotal };
        })
        .filter(a => a.apto)
        // Ordenamos por Score (pedagogía) y luego por Fecha (justicia)
        .sort((a, b) => b.score - a.score || new Date(a.created_at) - new Date(b.created_at));

    // 5. REPARTO CON LÍMITES [cite: 169, 311, 312]
    let plazasLibres = total_capacity; 
    const contadorPorCentro = {}; 

    for (const alumno of alumnosProcesados) {
        const centroId = alumno.id_center_assigned;
        if (!contadorPorCentro[centroId]) contadorPorCentro[centroId] = 0;

        // Regla: Máximo 4 por centro en Modalidad C 
        const limiteCentroSuperado = modalidad === 'C' && contadorPorCentro[centroId] >= max_students_per_center;

        if (plazasLibres > 0 && !limiteCentroSuperado) {
            // ✅ ADMITIR
            await confirmarInscripcion(alumno.id_student, id_workshop, alumno.id_interest);
            contadorPorCentro[centroId]++;
            plazasLibres--;
        } else {
            // ❌ RECHAZAR
            await db.query(`UPDATE student_interest SET status = 'CANCELLED' WHERE id_interest = $1`, [alumno.id_interest]);
        }
    }

    // Actualizar taller a FULL si no quedan plazas [cite: 35]
    if (plazasLibres === 0) {
        await db.query(`UPDATE workshops SET status = 'FULL' WHERE id_workshop = $1`, [id_workshop]);
    }
};

const confirmarInscripcion = async (studentId, workshopId, interestId) => {
    await db.query(`INSERT INTO workshop_enrollments (id_workshop, id_student) VALUES ($1, $2)`, [workshopId, studentId]);
    await db.query(`UPDATE student_interest SET status = 'CONFIRMED' WHERE id_interest = $1`, [interestId]);
};