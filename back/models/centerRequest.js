import db from "../data/db.js";

export const create = async (
  id_center,
  id_workshop,
  requested_slots,
  comments,
  student_count,
  course_level,
  id_teacher,
  students = []
) => {
  const client = await db.connect();
  try {
    await client.query("BEGIN");

    // 1. Create Request
    const textRequest = `
        INSERT INTO center_requests (
            id_center, id_workshop, requested_slots, comments, 
            student_count, course_level, id_teacher, 
            status
        )
        VALUES ($1, $2, $3, $4, $5, $6, $7, 'PENDING')
        RETURNING *
    `;
    const valuesRequest = [
      id_center,
      id_workshop,
      requested_slots,
      comments,
      student_count,
      course_level,
      id_teacher,
    ];
    const resRequest = await client.query(textRequest, valuesRequest);
    const newRequest = resRequest.rows[0];

    // 2. Insert Students
    if (students && students.length > 0) {
      const textStudent = `
        INSERT INTO center_request_students (id_request, id_student)
        VALUES ($1, $2)
      `;
      for (const studentId of students) {
        await client.query(textStudent, [newRequest.id_request, studentId]);
      }
    }

    await client.query("COMMIT");
    return newRequest;
  } catch (e) {
    await client.query("ROLLBACK");
    throw e;
  } finally {
    client.release();
  }
};

export const getByCenter = async (id_center) => {
  const text = `
        SELECT cr.*, w.title as workshop_title
        FROM center_requests cr
        JOIN workshops w ON cr.id_workshop = w.id_workshop
        WHERE cr.id_center = $1
    `;
  const result = await db.query(text, [id_center]);
  return result.rows;
};

export const getAllPending = async () => {
  const text = `
        SELECT cr.*, 
               w.title as workshop_title, 
               w.available_slots,
               c.center_name
        FROM center_requests cr
        JOIN workshops w ON cr.id_workshop = w.id_workshop
        JOIN centers c ON cr.id_center = c.id_user
        WHERE cr.status = 'PENDING'
        ORDER BY cr.created_at ASC
    `;
  const result = await db.query(text);
  return result.rows;
};

export const updateStatus = async (id, status) => {
  const text =
    "UPDATE center_requests SET status = $1 WHERE id_request = $2 RETURNING *";
  const result = await db.query(text, [status, id]);
  return result.rows[0];
};
