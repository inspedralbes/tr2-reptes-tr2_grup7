import db from "../data/db.js";

// Transaction to create Application + Nested Requests + Student Interests
export const createApplicationWithDetails = async (
  id_center,
  year_period,
  global_comments,
  items = []
) => {
  const client = await db.connect();
  try {
    await client.query("BEGIN");

    // 1. Create Application
    const appText = `
        INSERT INTO school_applications (id_center, year_period, status, global_comments)
        VALUES ($1, $2, 'SUBMITTED', $3)
        RETURNING *
    `;
    const appRes = await client.query(appText, [id_center, year_period, global_comments]);
    const newApp = appRes.rows[0];

    // 2. Process Items (Workshops)
    const savedRequests = [];
    for (const item of items) {
        const { id_workshop, requested_slots, comments, student_count, course_level, id_teacher, students } = item;
        
        // Insert Request
        const reqText = `
            INSERT INTO center_requests (
                id_application, id_workshop, requested_slots, comments, 
                student_count, course_level, id_teacher, status
            )
            VALUES ($1, $2, $3, $4, $5, $6, $7, 'PENDING')
            RETURNING *
        `;
        const reqValues = [
            newApp.id_application,
            id_workshop,
            requested_slots,
            comments,
            student_count,
            course_level,
            id_teacher
        ];
        const reqRes = await client.query(reqText, reqValues);
        const newReq = reqRes.rows[0];
        savedRequests.push(newReq);

        // Insert Student Interests
        if (students && students.length > 0) {
            for (const studentId of students) {
                 await client.query(`
                    INSERT INTO student_interest (id_student, id_workshop, id_request, status)
                    VALUES ($1, $2, $3, 'WAITING')
                `, [studentId, id_workshop, newReq.id_request]);
            }
        }
    }

    await client.query("COMMIT");
    return { application: newApp, requests: savedRequests };
  } catch (e) {
    await client.query("ROLLBACK");
    throw e;
  } finally {
    client.release();
  }
};

export const getByCenter = async (id_center) => {
    // Get Applications with basic status info
    const text = `
        SELECT * FROM school_applications WHERE id_center = $1 ORDER BY created_at DESC
    `;
    const result = await db.query(text, [id_center]);
    return result.rows;
};

// Maybe a method to get full details of an application (App + Requests)
export const getApplicationDetails = async (id_application) => {
    // This could return a nested object or joined rows.
    // Simple approach: Get App, then Get Requests
    const appRes = await db.query('SELECT * FROM school_applications WHERE id_application = $1', [id_application]);
    if (appRes.rows.length === 0) return null;
    
    const reqRes = await db.query(`
        SELECT cr.*, w.title as workshop_title, w.category as workshop_category, t.first_name as teacher_name, t.last_name as teacher_surname
        FROM center_requests cr
        JOIN workshops w ON cr.id_workshop = w.id_workshop
        LEFT JOIN teachers t ON cr.id_teacher = t.id_user
        WHERE cr.id_application = $1
    `, [id_application]);

    const requests = reqRes.rows;

    // Fetch students for each request
    for (const req of requests) {
        const studentRes = await db.query(`
            SELECT s.id_user, s.first_name, s.last_name, si.status as interest_status
            FROM student_interest si
            JOIN students s ON si.id_student = s.id_user
            WHERE si.id_request = $1
        `, [req.id_request]);
        req.students = studentRes.rows;
    }

    return { ...appRes.rows[0], requests };
};
