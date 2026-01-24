import { sendAssignmentNotification } from '../services/emailService.js';
import db from "../data/db.js";
import { obtenerFiltrosPorModalidad, assignTeachersByModality } from '../services/filterManager.js';
import { generateAssignmentReportHtml, generateAssignmentReportPdf } from '../reports/assignmentReport.js';

// ==========================================
// 1. GENERATE PROPOSAL (Simulation)
// ==========================================
// Renamed from executing directly to generating a proposal
export const generateProposal = async (config = {}) => {
    console.log("⚙️ Generando Propuesta de Asignación (Simulación)...");
    const actions = []; // Stores all proposed changes
    const proposalDetails = { students: [], teachers: [] }; // For UI Preview

    try {
        const talleres = await db.query(`
            SELECT id_workshop, title, modalidad, total_capacity, max_students_per_center, gender_audience, category 
            FROM workshops 
            WHERE request_deadline < NOW() AND status = 'OFFERED'
        `);

        // Load Initial States (for simulation accumulation)
        const studentLoadRes = await db.query(`
            SELECT s.id_center_assigned, COUNT(*) as total
            FROM workshop_enrollments we
            JOIN students s ON we.id_student = s.id_user
            JOIN workshops w ON we.id_workshop = w.id_workshop
            WHERE w.modalidad = 'C'
            GROUP BY s.id_center_assigned
        `);
        const simulatedStudentLoad = {}; // CenterID -> Count
        studentLoadRes.rows.forEach(r => simulatedStudentLoad[r.id_center_assigned] = parseInt(r.total));

        const teacherLoadRes = await db.query(`
            SELECT t.id_center_assigned, COUNT(*) as total
            FROM workshop_teachers wt
            JOIN teachers t ON wt.id_teacher = t.id_user
            GROUP BY t.id_center_assigned
        `);
        const simulatedTeacherLoad = {};
        teacherLoadRes.rows.forEach(r => simulatedTeacherLoad[r.id_center_assigned] = parseInt(r.total));

        // Track participating centers per workshop for teacher assignment
        const workshopParticipants = {}; // workshopId -> Set(centerId)

        // A. STUDENT ASSIGNMENT
        for (const taller of talleres.rows) {
             const result = await asignarAlumnosATallerSimulado(taller, simulatedStudentLoad, config);
             
             // Store Actions
             actions.push(...result.actions);
             
             // Track details for UI/Teacher Logic
             result.assignments.forEach(a => {
                 proposalDetails.students.push(a);
                 
                 // Add to participants list
                 if (!workshopParticipants[taller.id_workshop]) workshopParticipants[taller.id_workshop] = new Set();
                 workshopParticipants[taller.id_workshop].add(a.centerId);
             });
        }

        // B. TEACHER ASSIGNMENT
        for (const taller of talleres.rows) {
            const participatingCenters = Array.from(workshopParticipants[taller.id_workshop] || []);
            
            if (participatingCenters.length > 0) {
                 const teacherActions = await assignTeachersByModality(
                     taller.modalidad, 
                     taller, 
                     participatingCenters, 
                     participatingCenters, 
                     simulatedTeacherLoad, 
                     db,
                     config
                 );
                 
                 teacherActions.forEach(action => {
                     actions.push(action);
                     proposalDetails.teachers.push({
                         workshopId: action.workshopId,
                         centerId: action.centerId,
                         teacherName: action.teacherName,
                         reason: action.reason,
                         conflict: action.conflict
                     });
                 });
            }
        }

        // C. SAVE PROPOSAL
        const proposalData = { actions, details: proposalDetails };
        const saved = await db.query(
            `INSERT INTO assignment_proposals (data, status) VALUES ($1, 'PENDING') RETURNING id`, 
            [JSON.stringify(proposalData)]
        );
        
        console.log(`✅ Propuesta #${saved.rows[0].id} guardada.`);
        return { 
            proposalId: saved.rows[0].id, 
            details: proposalDetails 
        };

    } catch (error) {
        console.error("❌ Error generando propuesta:", error);
        throw error;
    }
};

// ==========================================
// 2. APPLY PROPOSAL (Execution)
// ==========================================
export const applyProposal = async (proposalId) => {
    console.log(`🚀 Aplicando propuesta #${proposalId}...`);
    
    try {
        const res = await db.query('SELECT * FROM assignment_proposals WHERE id = $1', [proposalId]);
        if (!res.rows.length) throw new Error('Propuesta no encontrada');
        
        const proposal = res.rows[0];
        if (proposal.status !== 'PENDING') throw new Error(`Propuesta no está PENDING (Estado: ${proposal.status})`);

        const { actions } = proposal.data;
        const allNewAssignments = []; 

        // A. EXECUTE ACTIONS
        for (const action of actions) {
            if (action.type === 'ASSIGN_STUDENT') {
                await confirmarInscripcion(action.studentId, action.workshopId, action.interestId);
                allNewAssignments.push(action); // Keep for email
            } else if (action.type === 'ASSIGN_TEACHER') {
                await db.query(`INSERT INTO workshop_teachers (id_workshop, id_teacher) VALUES ($1, $2) ON CONFLICT DO NOTHING`, 
                    [action.workshopId, action.teacherId]);
            }
        }

        // B. POST-PROCESSING (Status Updates)
        await db.query(`UPDATE assignment_proposals SET status = 'APPLIED' WHERE id = $1`, [proposalId]);
        
        // Update Workshop Status ('FULL')
        await updateWorkshopStatuses();

        // Update Center Request Status (ACCEPTED/PARTIAL)
        // Collect ALL request IDs involved
        const requestIds = allNewAssignments.map(a => a.requestId).filter(id => id);
        await updateRequestStatuses(requestIds);

        // C. NOTIFICATIONS
        await sendEmailsToCenters(allNewAssignments);

        // D. REPORT
        const html = await generateAssignmentReportHtml();
        const pdfBuffer = await generateAssignmentReportPdf(html);
        return Buffer.from(pdfBuffer).toString('base64');

    } catch (error) {
        console.error("❌ Error aplicando propuesta:", error);
        throw error;
    }
};

// ==========================================
// HELPERS
// ==========================================

const asignarAlumnosATallerSimulado = async (taller, simulatedGlobalLoad, config) => {
    const { id_workshop, title, modalidad, total_capacity, max_students_per_center, gender_audience } = taller;
    const actions = [];
    const assignments = []; // Simplified objects for internal tracking

    const LIMIT_GLOBAL_C = 12;

    const result = await db.query(`
        SELECT 
            si.id_interest, si.id_student, si.has_legal_papers, si.created_at, si.id_request,
            s.id_center_assigned, s.eso_grade, s.gender, s.risk_level, s.birth_date, s.first_name, s.last_name,
            cr.requested_slots 
        FROM student_interest si
        JOIN students s ON si.id_student = s.id_user
        JOIN center_requests cr ON si.id_request = cr.id_request
        WHERE cr.id_workshop = $1 AND si.status = 'WAITING'
    `, [id_workshop]);

    const alumnosCandidatos = result.rows;
    const reglas = obtenerFiltrosPorModalidad(modalidad);
    if (!reglas) return { actions: [], assignments: [] };

    // Filter & Sort
    const alumnosProcesados = alumnosCandidatos
        .map(alumno => {
            // Gender Filter (Always Active based on Workshop settings)
             if (gender_audience === 'F' && alumno.gender !== 'F') {
                  console.log(`   ⛔ RECHAZO GÉNERO: ${alumno.first_name}`);
                  return { ...alumno, apto: false };
             }
             if (gender_audience === 'M' && alumno.gender !== 'M') {
                  console.log(`   ⛔ RECHAZO GÉNERO: ${alumno.first_name}`);
                  return { ...alumno, apto: false };
             }
            
            const pasaExclusiones = reglas.exclusiones.every(filtro => filtro(alumno, taller));
            if (!pasaExclusiones) return { ...alumno, apto: false };

            const scoreTotal = reglas.prioridades.reduce((acc, filtro) => acc + filtro(alumno, taller, config), 0);
            return { ...alumno, apto: true, score: scoreTotal };
        })
        .filter(a => a.apto)
        .sort((a, b) => b.score - a.score || new Date(a.created_at) - new Date(b.created_at));

    // Distribution
    let plazasLibres = total_capacity; 
    const contadorPorCentro = {}; 

    for (const alumno of alumnosProcesados) {
        const centroId = alumno.id_center_assigned;
        if (!contadorPorCentro[centroId]) contadorPorCentro[centroId] = 0;
        
        // Configurable Limits
        const checkCenterLimit = config.center_limit_enabled !== false;
        const checkGlobalLimit = config.global_limit_enabled !== false;

        const limiteTallerSuperado = checkCenterLimit && modalidad === 'C' && contadorPorCentro[centroId] >= max_students_per_center;
        
        const currentGlobal = simulatedGlobalLoad[centroId] || 0;
        const limiteGlobalSuperado = checkGlobalLimit && modalidad === 'C' && currentGlobal >= LIMIT_GLOBAL_C;

        if (plazasLibres > 0 && !limiteTallerSuperado && !limiteGlobalSuperado) {
            // ASSIGN ACTION
            actions.push({
                type: 'ASSIGN_STUDENT',
                workshopId: id_workshop,
                workshopTitle: title,
                studentId: alumno.id_student,
                interestId: alumno.id_interest,
                studentName: `${alumno.first_name} ${alumno.last_name}`,
                centerId: centroId,
                requestId: alumno.id_request,
                score: alumno.score
            });
            
            assignments.push({
                workshopId: id_workshop,
                workshopTitle: title,
                centerId: centroId,
                studentName: `${alumno.first_name} ${alumno.last_name}`
            });

            contadorPorCentro[centroId]++;
            if (modalidad === 'C') simulatedGlobalLoad[centroId] = currentGlobal + 1;
            plazasLibres--;
        }
    }

    return { actions, assignments };
};

const confirmarInscripcion = async (studentId, workshopId, interestId) => {
    await db.query(`INSERT INTO workshop_enrollments (id_workshop, id_student) VALUES ($1, $2)`, [workshopId, studentId]);
    await db.query(`UPDATE student_interest SET status = 'CONFIRMED' WHERE id_interest = $1`, [interestId]);
};

// Post-Processing
const updateWorkshopStatuses = async () => {
    await db.query(`
        UPDATE workshops w
        SET status = 'FULL'
        WHERE available_slots <= (SELECT COUNT(*) FROM workshop_enrollments WHERE id_workshop = w.id_workshop)
    `);
};

const updateRequestStatuses = async (requestIds = []) => {
    if (!requestIds.length) return;
    const uniqueIds = [...new Set(requestIds)];

    for (const idRequest of uniqueIds) {
         const stats = await db.query(`
            SELECT 
                COUNT(*) as total,
                SUM(CASE WHEN status = 'CONFIRMED' THEN 1 ELSE 0 END) as confirmed
            FROM student_interest
            WHERE id_request = $1
        `, [idRequest]);

        const { total, confirmed } = stats.rows[0];
        const t = parseInt(total);
        const c = parseInt(confirmed);

        let newStatus = 'PENDING';
        if (c === t && t > 0) newStatus = 'ACCEPTED';
        else if (c === 0) newStatus = 'REJECTED'; 
        else newStatus = 'PARTIAL';

        await db.query(`UPDATE center_requests SET status = $1 WHERE id_request = $2`, [newStatus, idRequest]);
    }
};

const sendEmailsToCenters = async (allNewAssignments) => {
     const assignmentsByCenter = {};
     for (const a of allNewAssignments) {
         if (!assignmentsByCenter[a.centerId]) assignmentsByCenter[a.centerId] = [];
         assignmentsByCenter[a.centerId].push({
             workshopTitle: a.workshopTitle,
             studentName: a.studentName,
             status: 'ASSIGNED'
         });
     }

     for (const [centerId, assignments] of Object.entries(assignmentsByCenter)) {
         const centerRes = await db.query(`SELECT c.center_name, u.email FROM centers c JOIN users u ON c.id_user = u.id WHERE c.id_user = $1`, [centerId]);
         if (centerRes.rows.length > 0) {
             const { center_name, email } = centerRes.rows[0];
             await sendAssignmentNotification(email, center_name, assignments);
         }
     }
};