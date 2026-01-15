import db from "../data/db.js";

export const getAll = async () => {
  const result = await db.query(
    "SELECT * FROM workshops ORDER BY created_at DESC"
  );
  return result.rows;
};

export const getById = async (id) => {
  const result = await db.query(
    "SELECT * FROM workshops WHERE id_workshop = $1",
    [id]
  );
  return result.rows[0];
};

export const create = async (data) => {
  const {
    title,
    short_description,
    max_slots,
    category,
    start_date,
    end_date,
    status
  } = data;

  // Validar campos requeridos
  if (!title || !max_slots || !start_date || !end_date) {
    throw new Error('Missing required fields: title, max_slots, start_date, end_date');
  }

  // available_slots starts as max_slots
  const text = `
    INSERT INTO workshops (title, short_description, max_slots, available_slots, category, start_date, end_date, status)
    VALUES ($1, $2, $3, $3, $4, $5, $6, $7)
    RETURNING *
  `;
  const values = [
    title,
    short_description || null,
    max_slots,
    category || null,
    start_date,
    end_date,
    status || 'OFFERED'
  ];
  const result = await db.query(text, values);
  return result.rows[0];
};

export const update = async (id, data) => {
  const {
    title,
    short_description,
    max_slots,
    available_slots,
    category,
    start_date,
    end_date,
    status
  } = data;

  const text = `
    UPDATE workshops 
    SET title=$1, short_description=$2, max_slots=$3, available_slots=$4, category=$5, start_date=$6, end_date=$7, status=$8
    WHERE id_workshop = $9
    RETURNING *
  `;
  const values = [
    title,
    short_description,
    max_slots,
    available_slots, // If updating, we might need logic to keep sync, but basic update for now
    category,
    start_date,
    end_date,
    status,
    id,
  ];
  const result = await db.query(text, values);
  return result.rows[0];
};

export const remove = async (id) => {
  const result = await db.query(
    "DELETE FROM workshops WHERE id_workshop = $1 RETURNING *",
    [id]
  );
  return result.rows[0];
};
