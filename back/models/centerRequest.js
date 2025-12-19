import db from "../data/db.js";

export const create = async (
  id_center,
  id_workshop,
  requested_slots,
  comments
) => {
  const text = `
        INSERT INTO center_requests (id_center, id_workshop, requested_slots, comments, status)
        VALUES ($1, $2, $3, $4, 'PENDING')
        RETURNING *
    `;
  const values = [id_center, id_workshop, requested_slots, comments];
  const result = await db.query(text, values);
  return result.rows[0];
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
