import db from "../data/db.js";

export const create = async (data) => {
  const {
    id_application,
    id_workshop,
    requested_slots,
    comments,
    student_count,
    course_level,
    id_teacher,
    students = [],
  } = data;

  const client = await db.connect();
  try {
    await client.query("BEGIN");

    // 1. Create Request
    const textRequest = `
        INSERT INTO center_requests (
            id_application, id_workshop, requested_slots, comments, 
            student_count, course_level, id_teacher, 
            status
        )
        VALUES ($1, $2, $3, $4, $5, $6, $7, 'PENDING')
        RETURNING *
    `;
    const valuesRequest = [
      id_application,
      id_workshop,
      requested_slots,
      comments,
      student_count,
      course_level,
      id_teacher,
    ];
    const resRequest = await client.query(textRequest, valuesRequest);
    const newRequest = resRequest.rows[0];

    // 2. Insert Students Interests/Links
    // Note: Schema has center_request_students AND student_interest.
    // We should populate both or just one depending on logic.
    // Insert script populated "center_request_students" AND "student_interest".

    if (students && students.length > 0) {
      // 2a. Link to Request
      const textLink = `
        INSERT INTO center_request_students (id_request, id_student)
        VALUES ($1, $2)
      `;
      // 2b. Create Interest Record
      const textInterest = `
         INSERT INTO student_interest (id_student, id_workshop, id_request, status)
         VALUES ($1, $2, $3, 'WAITING')
         ON CONFLICT (id_student, id_workshop) DO NOTHING
      `;

      for (const studentId of students) {
        await client.query(textLink, [newRequest.id_request, studentId]);
        await client.query(textInterest, [
          studentId,
          id_workshop,
          newRequest.id_request,
        ]);
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
        SELECT cr.*, w.title as workshop_title, sa.status as app_status, sa.year_period,
               t.first_name as teacher_first_name, t.last_name as teacher_last_name
        FROM center_requests cr
        JOIN school_applications sa ON cr.id_application = sa.id_application
        JOIN workshops w ON cr.id_workshop = w.id_workshop
        LEFT JOIN teachers t ON cr.id_teacher = t.id_user
        WHERE sa.id_center = $1
    `;
  const result = await db.query(text, [id_center]);
  return result.rows;
};

export const getAllPending = async () => {
  const text = `
        SELECT cr.*, 
               w.title as workshop_title, 
               w.available_slots,
               c.center_name,
               sa.id_application
        FROM center_requests cr
        JOIN school_applications sa ON cr.id_application = sa.id_application
        JOIN workshops w ON cr.id_workshop = w.id_workshop
        JOIN centers c ON sa.id_center = c.id_user
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
