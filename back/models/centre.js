import db from "../data/db.js";

export const getAll = async () => {
  const text = `
    SELECT c.*, u.email, u.is_active 
    FROM centers c 
    JOIN users u ON c.id_user = u.id
  `;
  const result = await db.query(text);
  return result.rows;
};

export const getById = async (id) => {
  const text = `
    SELECT c.*, u.email, u.is_active 
    FROM centers c 
    JOIN users u ON c.id_user = u.id 
    WHERE c.id_user = $1
  `;
  const result = await db.query(text, [id]);
  return result.rows[0];
};

// Use User.create for creating new centers (handles transaction)
// This method is kept for specific cases where user exists but center doesn't (unlikely)
export const create = async (centre) => {
  const { id_user, center_name, center_code, address, phone } = centre;
  const text = `
    INSERT INTO centers (id_user, center_name, center_code, address, phone)
    VALUES ($1, $2, $3, $4, $5)
    RETURNING *
  `;
  const values = [id_user, center_name, center_code, address, phone];
  const result = await db.query(text, values);
  return result.rows[0];
};

export const update = async (id, centre) => {
  const { center_name, center_code, address, phone } = centre;
  const text = `
    UPDATE centers
    SET center_name = $1, center_code = $2, address = $3, phone = $4
    WHERE id_user = $5
    RETURNING *
  `;
  const values = [center_name, center_code, address, phone, id];
  const result = await db.query(text, values);
  return result.rows[0];
};

export const remove = async (id) => {
  // Primero eliminamos las solicitudes del centro para evitar errores de FK
  await db.query("DELETE FROM center_requests WHERE id_center = $1", [id]);
  
  // Deleting the user will cascade delete the center
  const text = "DELETE FROM users WHERE id = $1 RETURNING *";
  const result = await db.query(text, [id]);
  return result.rows[0];
};
