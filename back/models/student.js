import db from "../data/db.js";

export const updateStudent = async (id, data) => {
  const { first_name, last_name, phone, birth_date } = data;
  const text = `
    UPDATE students
    SET first_name = $1, last_name = $2, phone = $3, birth_date = $4
    WHERE id_user = $5
    RETURNING *
  `;
  const values = [first_name, last_name, phone, birth_date, id];
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
