import * as db from "../data/db.js";

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
    schedule,
    duration_hours,
    teacher_id,
  } = data;
  // available_slots nace igual a max_slots
  const text = `
    INSERT INTO workshops (title, short_description, max_slots, available_slots, category, schedule, duration_hours, teacher_id)
    VALUES ($1, $2, $3, $3, $4, $5, $6, $7)
    RETURNING *
  `;
  const values = [
    title,
    short_description,
    max_slots,
    category,
    schedule,
    duration_hours,
    teacher_id,
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
    schedule,
    status,
    duration_hours,
    is_active,
    teacher_id,
  } = data;
  const text = `
    UPDATE workshops 
    SET title=$1, short_description=$2, max_slots=$3, available_slots=$4, category=$5, schedule=$6, status=$7, duration_hours=$8, is_active=$9, teacher_id=$10
    WHERE id_workshop = $11
    RETURNING *
  `;
  const values = [
    title,
    short_description,
    max_slots,
    available_slots,
    category,
    schedule,
    status,
    duration_hours,
    is_active,
    teacher_id,
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
