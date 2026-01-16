import db from "../data/db.js";

export const create = async (
  id_student,
  id_workshop,
  verified_by_teacher_id,
  id_request = null
) => {
  const text = `
        INSERT INTO student_interest (id_student, id_workshop, verified_by_teacher_id, id_request, status)
        VALUES ($1, $2, $3, $4, 'WAITING')
        RETURNING *
    `;
  // Status 'WAITING' because it needs matching engine approval.
  const values = [id_student, id_workshop, verified_by_teacher_id, id_request];
  const result = await db.query(text, values);
  return result.rows[0];
};

export const getByCenter = async (id_center) => {
  // We need to join with students to see which center they belong to
  const text = `
        SELECT si.*, s.first_name, s.last_name, w.title as workshop_title
        FROM student_interest si
        JOIN students s ON si.id_student = s.id_user
        JOIN workshops w ON si.id_workshop = w.id_workshop
        WHERE s.id_center_assigned = $1
    `;
  const result = await db.query(text, [id_center]);
  return result.rows;
};
