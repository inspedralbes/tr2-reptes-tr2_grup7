import db from "../data/db.js";
import { obtenerFiltrosPorModalidad } from '../services/filterManager.js';
import { generateAssignmentReportHtml } from '../reports/assignmentReport.js';

export const ejecutarProcesoAsignacion = async (config = {}) => {
    console.log("⚙️ Iniciando Motor de Asignación ENGINY...", config);

    try {
        // 1. Obtenemos los talleres que han cerrado su plazo [cite: 36, 43]
        const talleres = await db.query(`
            SELECT id_workshop, title, modalidad, total_capacity, max_students_per_center 
            FROM workshops 
            WHERE request_deadline < NOW() AND status = 'OFFERED'
        `);

        for (const taller of talleres.rows) {
            console.log(`\n📦 Procesando: ${taller.title} (${taller.modalidad})`);
            await asignarAlumnosATaller(taller, config);
        }

        console.log("\n✅ Proceso de asignación finalizado con éxito.");
        
        // 7. GENERAR RESUMEN FINAL
        return await generateAssignmentReportHtml();
    } catch (error) {
        console.error("❌ Error en el matchingEngine:", error);
        throw error; // Rethrow to let the controller handle it
    }
};

const getGlobalCenterCounts = async (modalidad) => {
    if (modalidad !== 'C') return {};
    
    // Count existing enrollments per center for this modality
    const result = await db.query(`
        SELECT s.id_center_assigned, COUNT(*) as total
        FROM workshop_enrollments we
        JOIN students s ON we.id_student = s.id_user
        JOIN workshops w ON we.id_workshop = w.id_workshop
        WHERE w.modalidad = 'C'
        GROUP BY s.id_center_assigned
    `);
    
    const counts = {};
    result.rows.forEach(row => {
        counts[row.id_center_assigned] = parseInt(row.total, 10);
    });
    return counts;
};

const asignarAlumnosATaller = async (taller, config) => {
    const { id_workshop, modalidad, total_capacity, max_students_per_center } = taller;
    
    // Global tracking for Modality C
    const globalCenterCounts = await getGlobalCenterCounts(modalidad);
    const LIMIT_GLOBAL_C = 12;

    // 2. LA QUERY MAESTRA: Obtenemos los alumnos y sus datos pedagógicos [cite: 41, 148]
    // NEW: Filter by students LINKED to a Center Request
    const result = await db.query(`
        SELECT 
            si.id_interest, si.id_student, si.has_legal_papers, si.created_at, si.id_request,
            s.id_center_assigned, s.eso_grade, s.gender, s.risk_level, s.birth_date, s.first_name, s.last_name,
            cr.requested_slots -- We can use this to limit per-center if needed, or just rely on 'max_students_per_center'
        FROM student_interest si
        JOIN students s ON si.id_student = s.id_user
        JOIN center_requests cr ON si.id_request = cr.id_request -- Enforce link to request
        WHERE si.id_workshop = $1 
          AND si.status = 'WAITING'
          -- Optional: Ensure request is not Rejected? User said "requests shouldn't be rejected".
          -- So we process all valid requests.
    `, [id_workshop]);

    const alumnosCandidatos = result.rows;

    // 3. OBTENER LAS REGLAS: Pedimos al gestor los archivos A, B o C
    const reglas = obtenerFiltrosPorModalidad(modalidad);
    if (!reglas) return;

    // 4. APLICAR FILTROS (Aquí es donde se "pasa" el objeto usuario a tus constantes)
    const alumnosProcesados = alumnosCandidatos
        .map(alumno => {
            // Comprobamos exclusiones (¿cumple edad, papeles, género?) [cite: 32, 158]
            const pasaExclusiones = reglas.exclusiones.every((filtro, index) => {
                const pass = filtro(alumno, taller);
                if (!pass) {
                    console.log(`   ⛔ RECHAZO INICIAL: ${alumno.first_name} ${alumno.last_name} falló filtro #${index}`);
                    console.log(`      Valor has_legal_papers: ${alumno.has_legal_papers} (Type: ${typeof alumno.has_legal_papers})`);
                }
                return pass;
            });
            
            if (!pasaExclusiones) return { ...alumno, apto: false, score: -1 };

            // Calculamos puntuación (¿tiene riesgo de absentismo?) [cite: 142, 306]
            const scoreTotal = reglas.prioridades.reduce((acc, filtro) => acc + filtro(alumno, taller, config), 0);
            
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
        // Regla: Máximo 4 por centro en Modalidad C (Por taller)
        if (!contadorPorCentro[centroId]) contadorPorCentro[centroId] = 0;
        const limiteTallerSuperado = modalidad === 'C' && contadorPorCentro[centroId] >= max_students_per_center;

        // Regla: Máximo 12 por centro en Modalidad C (Global)
        const currentGlobal = globalCenterCounts[centroId] || 0;
        const limiteGlobalSuperado = modalidad === 'C' && currentGlobal >= LIMIT_GLOBAL_C;

        if (plazasLibres > 0 && !limiteTallerSuperado && !limiteGlobalSuperado) {
            // ✅ ADMITIR
            await confirmarInscripcion(alumno.id_student, id_workshop, alumno.id_interest);
            console.log(`   👉 🟢 ASIGNADO: ${alumno.first_name} ${alumno.last_name} (Score: ${alumno.score.toFixed(2)})`);
            contadorPorCentro[centroId]++;
            if (modalidad === 'C') {
                globalCenterCounts[centroId] = currentGlobal + 1;
            }
            plazasLibres--;
        } else {
            // ❌ RECHAZAR
            await db.query(`UPDATE student_interest SET status = 'CANCELLED' WHERE id_interest = $1`, [alumno.id_interest]);
            console.log(`   👉 🔴 EXCLUIDO: ${alumno.first_name} ${alumno.last_name} (Score: ${alumno.score.toFixed(2)}) - Sin plaza o límites excedidos`);
        }
    }

    // Actualizar taller a FULL si no quedan plazas [cite: 35]
    if (plazasLibres === 0) {
        await db.query(`UPDATE workshops SET status = 'FULL' WHERE id_workshop = $1`, [id_workshop]);
    }

    // 6. ACTUALIZAR ESTADO DE LAS SOLICITUDES (CENTER_REQUESTS)
    // Recopilamos los IDs de solicitud afectados
    const solicitudesAfectadas = new Set(alumnosCandidatos.map(a => a.id_request)); // Note: make sure id_request is in SELECT

    for (const idRequest of solicitudesAfectadas) {
        // Contamos cuántos estudiantes tiene esa solicitud y cuántos han entrado
        const stats = await db.query(`
            SELECT 
                COUNT(*) as total,
                SUM(CASE WHEN status = 'CONFIRMED' THEN 1 ELSE 0 END) as confirmed
            FROM student_interest
            WHERE id_request = $1
        `, [idRequest]);

        const { total, confirmed } = stats.rows[0];
        const totalInt = parseInt(total);
        const confirmedInt = parseInt(confirmed);

        let newStatus = 'PENDING';
        if (confirmedInt === totalInt && totalInt > 0) {
            newStatus = 'ACCEPTED';
        } else if (confirmedInt === 0) {
            newStatus = 'REJECTED';
        } else {
            newStatus = 'PARTIAL';
        }

        await db.query(`UPDATE center_requests SET status = $1 WHERE id_request = $2`, [newStatus, idRequest]);
        console.log(`📝 Solicitud ${idRequest} actualizada a ${newStatus} (${confirmedInt}/${totalInt})`);
    }

// End of function
};

// ... (existing confirmarInscripcion)

const confirmarInscripcion = async (studentId, workshopId, interestId) => {
    await db.query(`INSERT INTO workshop_enrollments (id_workshop, id_student) VALUES ($1, $2)`, [workshopId, studentId]);
    await db.query(`UPDATE student_interest SET status = 'CONFIRMED' WHERE id_interest = $1`, [interestId]);
};