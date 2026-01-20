import db from "../data/db.js";

// Stats & Dashboard
export const getStats = async () => {
    // Total peticiones
    const totalRequestsResult = await db.query("SELECT COUNT(*) as total FROM center_requests");
    const totalRequests = parseInt(totalRequestsResult.rows[0].total);

    // Peticiones asignadas (aceptadas)
    const assignedRequestsResult = await db.query("SELECT COUNT(*) as assigned FROM center_requests WHERE status = 'ACCEPTED'");
    const assignedRequests = parseInt(assignedRequestsResult.rows[0].assigned);

    // Peticiones pendientes
    const pendingRequestsResult = await db.query("SELECT COUNT(*) as pending FROM center_requests WHERE status = 'PENDING'");
    const pendingRequests = parseInt(pendingRequestsResult.rows[0].pending);

    // Centros activos
    const activeCentersResult = await db.query("SELECT COUNT(*) as active_centers FROM centers c JOIN users u ON c.id_user = u.id WHERE u.is_active = true");
    const activeCenters = parseInt(activeCentersResult.rows[0].active_centers);

    return {
        totalRequests,
        assignedRequests,
        pendingRequests,
        activeCenters,
    };
};

// Request Management
export const getAllRequests = async () => {
    const query = `
      SELECT 
        cr.*, 
        c.center_name, 
        w.title as workshop_title, 
        w.start_date, 
        w.end_date,
        (SELECT COUNT(*) FROM student_interest si WHERE si.id_request = cr.id_request) as total_students,
        (SELECT COUNT(*) FROM workshop_enrollments we 
         JOIN student_interest si ON we.id_student = si.id_student 
         WHERE si.id_request = cr.id_request AND we.id_workshop = cr.id_workshop) as accepted_students
      FROM center_requests cr
      JOIN school_applications sa ON cr.id_application = sa.id_application
      JOIN centers c ON sa.id_center = c.id_user
      JOIN workshops w ON cr.id_workshop = w.id_workshop
      ORDER BY cr.created_at DESC
    `;
    const result = await db.query(query);
    return result.rows;
};

export const getPendingRequests = async () => {
    const query = `
      SELECT cr.*, c.center_name, w.title as workshop_title, w.start_date, w.end_date
      FROM center_requests cr
      JOIN school_applications sa ON cr.id_application = sa.id_application
      JOIN centers c ON sa.id_center = c.id_user
      JOIN workshops w ON cr.id_workshop = w.id_workshop
      WHERE cr.status = 'PENDING'
      ORDER BY cr.created_at DESC
    `;
    const result = await db.query(query);
    return result.rows;
};

export const getRequestById = async (id) => {
    const requestQuery = `
      SELECT 
        cr.*, 
        c.center_name, 
        w.title as workshop_title, 
        w.start_date, 
        w.end_date,
        w.id_workshop
      FROM center_requests cr
      JOIN school_applications sa ON cr.id_application = sa.id_application
      JOIN centers c ON sa.id_center = c.id_user
      JOIN workshops w ON cr.id_workshop = w.id_workshop
      WHERE cr.id_request = $1
    `;
    const requestResult = await db.query(requestQuery, [id]);
    
    if (requestResult.rows.length === 0) return null;
    
    return requestResult.rows[0];
};

export const getRequestStudents = async (requestId, workshopId) => {
    const studentsQuery = `
      SELECT 
        s.id_user,
        s.first_name,
        s.last_name,
        s.eso_grade,
        CASE 
          WHEN we.id_enrollment IS NOT NULL THEN true 
          ELSE false 
        END as is_accepted
      FROM student_interest si
      JOIN students s ON si.id_student = s.id_user
      LEFT JOIN workshop_enrollments we ON we.id_student = s.id_user AND we.id_workshop = $2
      WHERE si.id_request = $1
      ORDER BY s.last_name, s.first_name
    `;
    const result = await db.query(studentsQuery, [requestId, workshopId]);
    return result.rows;
};

export const updateRequestStatus = async (id, status) => {
    await db.query("UPDATE center_requests SET status = $1 WHERE id_request = $2", [status, id]);
};

export const deleteRequest = async (id) => {
    await db.query("DELETE FROM center_requests WHERE id_request = $1", [id]);
};

// Teacher Management Reporting
export const getAvailableTeachers = async () => {
    const query = `
      SELECT t.id_user, t.first_name, t.last_name, u.email, c.center_name
      FROM teachers t
      JOIN users u ON t.id_user = u.id
      LEFT JOIN centers c ON t.id_center_assigned = c.id_user
      WHERE u.is_active = true
    `;
    const result = await db.query(query);
    return result.rows;
};

export const getTopWorkshops = async () => {
    const query = `
      SELECT w.title, COUNT(cr.id_request) as request_count
      FROM workshops w
      LEFT JOIN center_requests cr ON w.id_workshop = cr.id_workshop
      GROUP BY w.id_workshop, w.title
      ORDER BY request_count DESC
      LIMIT 10
    `;
    const result = await db.query(query);
    return result.rows;
};

export const getAllCenters = async () => {
    const query = `
      SELECT c.id_user, c.center_name, c.center_code, u.email, u.is_active
      FROM centers c
      JOIN users u ON c.id_user = u.id
      WHERE u.is_active = true
      ORDER BY c.center_name ASC
    `;
    const result = await db.query(query);
    return result.rows;
};
