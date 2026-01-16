import db from "../data/db.js";

// Create or Update (Upsert) - though simplest is INSERT/Update logic.
// Let's do simple Create.
export const create = async (id_workshop, id_student, grade, comments) => {
  // Check if exists? schema has unique constraint.
  const text = `
    INSERT INTO evaluations (id_workshop, id_student, grade, comments)
    VALUES ($1, $2, $3, $4)
    ON CONFLICT (id_workshop, id_student) 
    DO UPDATE SET grade = EXCLUDED.grade, comments = EXCLUDED.comments, created_at = CURRENT_TIMESTAMP
    RETURNING *
  `;
  const result = await db.query(text, [id_workshop, id_student, grade, comments]);
  return result.rows[0];
};

export const getByWorkshop = async (id_workshop) => {
  const text = `
    SELECT s.id_user as id_student, s.first_name, s.last_name, 
           e.id_evaluation, e.grade, e.comments, e.created_at
    FROM workshop_enrollments we
    JOIN students s ON we.id_student = s.id_user
    LEFT JOIN evaluations e ON we.id_workshop = e.id_workshop AND we.id_student = e.id_student
    WHERE we.id_workshop = $1
    ORDER BY s.last_name ASC
  `;
  const result = await db.query(text, [id_workshop]);
  return result.rows;
};
