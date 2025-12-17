import * as db from "../db.js";

export const getAll = async () => {
  const text = "SELECT * FROM Usuaris";
  const result = await db.query(text);
  return result.rows;
};

export const getById = async (id) => {
  const text = "SELECT * FROM Usuaris WHERE id_usuari = $1";
  const result = await db.query(text, [id]);
  return result.rows[0];
};

export const create = async (usuario) => {
  const { nom, cognoms, email, password_hash, rol, telefon, id_centre } =
    usuario;
  const text = `
        INSERT INTO Usuaris (nom, cognoms, email, password_hash, rol, telefon, id_centre)
        VALUES ($1, $2, $3, $4, $5, $6, $7)
        RETURNING *
    `;
  const values = [nom, cognoms, email, password_hash, rol, telefon, id_centre];
  const result = await db.query(text, values);
  return result.rows[0];
};

export const update = async (id, usuario) => {
  const { nom, cognoms, email, rol, telefon, id_centre } = usuario;
  const text = `
        UPDATE Usuaris
        SET nom = $1, cognoms = $2, email = $3, rol = $4, telefon = $5, id_centre = $6
        WHERE id_usuari = $7
        RETURNING *
    `;
  // Nota: password_hash no se actualiza aquí por seguridad, requeriría lógica aparte o comprobar si viene.
  // Para simplificar, asumo actualización de campos básicos.
  const values = [nom, cognoms, email, rol, telefon, id_centre, id];
  const result = await db.query(text, values);
  return result.rows[0];
};

export const remove = async (id) => {
  const text = "DELETE FROM Usuaris WHERE id_usuari = $1 RETURNING *";
  const result = await db.query(text, [id]);
  return result.rows[0];
};
