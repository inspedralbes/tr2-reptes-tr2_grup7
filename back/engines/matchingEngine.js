import { sendAssignmentNotification } from '../services/emailService.js';
import db from "../data/db.js";
import { obtenerFiltrosPorModalidad } from '../services/filterManager.js';
import { generateAssignmentReportHtml, generateAssignmentReportPdf } from '../reports/assignmentReport.js';

export const ejecutarProcesoAsignacion = async (config = {}) => {
    console.log("⚙️ Iniciando Motor de Asignación ENGINY...", config);

    try {
        // 1. Obtenemos los talleres que han cerrado su plazo [cite: 36, 43]
        const talleres = await db.query(`
            SELECT id_workshop, title, modalidad, total_capacity, max_students_per_center 
            FROM workshops 
            WHERE request_deadline < NOW() AND status = 'OFFERED'
        `);



        // NEW: Track assigned students for emails
        const allNewAssignments = [];

        for (const taller of talleres.rows) {
            console.log(`\n📦 Procesando: ${taller.title} (${taller.modalidad})`);
            const assignedInWorkshop = await asignarAlumnosATaller(taller, config);
            allNewAssignments.push(...assignedInWorkshop);
        }

        console.log("\n✅ Proceso de asignación finalizado con éxito.");
        
        // 8. ENVIAR CORREOS
        console.log("📧 Enviando notificaciones...");

        if (allNewAssignments.length === 0) {
            console.log("ℹ️ No hay nuevas asignaciones para notificar (¿Ya se ejecutó el matching?).");
        }

        // Group by center
        const assignmentsByCenter = {};
        for (const a of allNewAssignments) {
            if (!assignmentsByCenter[a.centerId]) assignmentsByCenter[a.centerId] = [];
            assignmentsByCenter[a.centerId].push(a);
        }

        // Send emails
        for (const [centerId, assignments] of Object.entries(assignmentsByCenter)) {
            // Get Center Email and Name
            const centerRes = await db.query(
                `SELECT c.center_name, u.email 
                 FROM centers c 
                 JOIN users u ON c.id_user = u.id 
                 WHERE c.id_user = $1`, 
                [centerId]
            );
            
            if (centerRes.rows.length > 0) {
                const { center_name, email } = centerRes.rows[0];
                await sendAssignmentNotification(email, center_name, assignments);
            }
        }

        // 7. GENERAR RESUMEN FINAL (PDF)

        const html = await generateAssignmentReportHtml();
        const pdfBuffer = await generateAssignmentReportPdf(html);
        return Buffer.from(pdfBuffer).toString('base64');

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
    const { id_workshop, title, modalidad, total_capacity, max_students_per_center } = taller;
    const localAssignments = []; // List to track assignments for emails
    
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
        WHERE cr.id_workshop = $1 
          AND si.status = 'WAITING'
    `, [id_workshop]);

    const alumnosCandidatos = result.rows;

    // 3. OBTENER LAS REGLAS: Pedimos al gestor los archivos A, B o C
    const reglas = obtenerFiltrosPorModalidad(modalidad);
    if (!reglas) return [];

    // 4. APLICAR FILTROS (Aquí es donde se "pasa" el objeto usuario a tus constantes)
    const alumnosProcesados = alumnosCandidatos
        .map(alumno => {
            // Comprobamos exclusiones (¿cumple edad, papeles, género?) [cite: 32, 158]
            const pasaExclusiones = reglas.exclusiones.every((filtro, index) => {
                const pass = filtro(alumno, taller);
                if (!pass) {
                    console.log(`   ⛔ RECHAZO INICIAL: ${alumno.first_name} ${alumno.last_name} falló filtro #${index}`);
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
            
            // Track for Email
            localAssignments.push({
                centerId: centroId,
                workshopTitle: title,
                studentName: `${alumno.first_name} ${alumno.last_name}`,
                status: 'ASSIGNED'
            });

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
    const solicitudesAfectadas = new Set(alumnosCandidatos.map(a => a.id_request)); 

    for (const idRequest of solicitudesAfectadas) {
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

    return localAssignments;
};

// ... (existing confirmarInscripcion)

const confirmarInscripcion = async (studentId, workshopId, interestId) => {
    await db.query(`INSERT INTO workshop_enrollments (id_workshop, id_student) VALUES ($1, $2)`, [workshopId, studentId]);
    await db.query(`UPDATE student_interest SET status = 'CONFIRMED' WHERE id_interest = $1`, [interestId]);
};