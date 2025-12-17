import * as db from "../data/db.js";

export const getAll = async () => {
  const text = "SELECT * FROM centers";
  const result = await db.query(text);
  return result.rows;
};

export const getById = async (id) => {
  const text = "SELECT * FROM centers WHERE id_center = $1";
  const result = await db.query(text, [id]);
  return result.rows[0];
};

export const create = async (centre) => {
  //destructuring que saca las propiedades center_name etc... del parametro centre
  const { center_name, center_code, address, phone } = centre;
  const text = `
    INSERT INTO centers (center_name, center_code, address, phone)
    VALUES ($1, $2, $3, $4)
    RETURNING *
    `;
  const values = [center_name, center_code, address, phone];
  const result = await db.query(text, values);
  return result.rows[0];
};

export const update = async (id, centre) => {
  const { center_name, center_code, address, phone } = centre;
  const text = `
    UPDATE centers
    SET center_name = $1, center_code = $2, address = $3, phone = $4
    WHERE id_center = $5
    RETURNING *
    `;
  const values = [center_name, center_code, address, phone, id];
  const result = await db.query(text, values);
  return result.rows[0];
};

export const remove = async (id) => {
  const text = "DELETE FROM centers WHERE id_center = $1 RETURNING *";
  const result = await db.query(text, [id]);
  return result.rows[0];
};
