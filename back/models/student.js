import db from "../data/db.js";

export const updateStudent = async (id, data) => {
  const { first_name, last_name, phone, birth_date, eso_grade, gender, risk_level, has_legal_papers } = data;
  const text = `
    UPDATE students
    SET first_name = $1, last_name = $2, phone = $3, birth_date = $4, eso_grade = $5, gender = $6, risk_level = $7, has_legal_papers = $8
    WHERE id_user = $9
    RETURNING *
  `;
  const values = [
    first_name,
    last_name,
    phone,
    birth_date,
    eso_grade,
    gender,
    risk_level,
    has_legal_papers,
    id,
  ];
  const result = await db.query(text, values);
  return result.rows[0];
};

export const deleteStudent = async (id) => {
  // Deleting from users table will cascade delete from students table
  const text = "DELETE FROM users WHERE id = $1 RETURNING *";
  const result = await db.query(text, [id]);
  return result.rows[0];
};

export const getById = async (id) => {
  const text = `
    SELECT s.*, u.email, u.is_active
    FROM students s
    JOIN users u ON s.id_user = u.id
    WHERE s.id_user = $1
  `;
  const result = await db.query(text, [id]);
  return result.rows[0];
};
