import db from "../data/db.js";

// Create a new period
export const create = async (name, start_date, end_date) => {
    // Optional: Check if there is already an OPEN period overlapping?
    // For simplicity, just insert.
    const text = `
        INSERT INTO application_periods (name, start_date, end_date, status)
        VALUES ($1, $2, $3, 'OPEN')
        RETURNING *
    `;
    const result = await db.query(text, [name, start_date, end_date]);
    return result.rows[0];
};

// Get all periods
export const getAll = async () => {
    const text = `SELECT * FROM application_periods ORDER BY created_at DESC`;
    const result = await db.query(text);
    return result.rows;
};

// Get active period (There should ideally be only one OPEN)
export const getActive = async () => {
    const text = `SELECT * FROM application_periods WHERE status = 'OPEN' LIMIT 1`;
    const result = await db.query(text);
    return result.rows[0];
};

// Get period by ID
export const getById = async (id) => {
    const text = `SELECT * FROM application_periods WHERE id_period = $1`;
    const result = await db.query(text, [id]);
    return result.rows[0];
};

// Close a period
export const updateStatus = async (id, status) => {
    const text = `UPDATE application_periods SET status = $1 WHERE id_period = $2 RETURNING *`;
    const result = await db.query(text, [status, id]);
    return result.rows[0];
};
// Get the latest period (regardless of status)
export const getLatest = async () => {
    const text = `SELECT * FROM application_periods ORDER BY created_at DESC LIMIT 1`;
    const result = await db.query(text);
    return result.rows[0];
};
