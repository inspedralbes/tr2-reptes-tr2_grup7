import * as db from "../data/db.js";

//Aquí es on es fa tota la lógica de la base de dades SELECT, INSERT, UPDATE, DELETE

export const getAll = async () => {
  const text = "SELECT * FROM users";
  const result = await db.query(text);
  return result.rows;
};

export const getById = async (id) => {
  const text = "SELECT * FROM users WHERE id_user = $1";
  const result = await db.query(text, [id]);
  return result.rows[0];
};

export const create = async (usuario) => {
  const {
    first_name,
    last_name,
    email,
    password_hash,
    role,
    phone,
    id_center,
  } = usuario;
  const text = `
        INSERT INTO users (first_name, last_name, email, password_hash, role, phone, id_center)
        VALUES ($1, $2, $3, $4, $5, $6, $7)
        RETURNING *
    `;
  const values = [
    first_name,
    last_name,
    email,
    password_hash,
    role,
    phone,
    id_center,
  ];
  const result = await db.query(text, values);
  return result.rows[0];
};

export const update = async (id, usuario) => {
  const { first_name, last_name, email, role, phone, id_center } = usuario;
  const text = `
        UPDATE users
        SET first_name = $1, last_name = $2, email = $3, role = $4, phone = $5, id_center = $6
        WHERE id_user = $7
        RETURNING *
    `;
  // Nota: password_hash no se actualiza aquí por seguridad, requeriría lógica aparte o comprobar si viene.
  // Para simplificar, asumo actualización de campos básicos.
  const values = [first_name, last_name, email, role, phone, id_center, id];
  const result = await db.query(text, values);
  return result.rows[0];
};

export const remove = async (id) => {
  const text = "DELETE FROM users WHERE id_user = $1 RETURNING *";
  const result = await db.query(text, [id]);
  return result.rows[0];
};
