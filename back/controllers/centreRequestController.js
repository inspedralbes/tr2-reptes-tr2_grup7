import * as Request from "../models/centerRequest.js";
import * as Interest from "../models/interest.js";
import db from "../data/db.js"; // Import db for transactions

export const createRequest = async (req, res) => {
  const client = await db.pool.connect();
  try {
    const { id_workshop, student_ids, comments } = req.body;
    const id_center = req.user.id; // Center ID (User ID)

    if (!student_ids || !Array.isArray(student_ids) || student_ids.length === 0) {
      return res.status(400).json({ error: "Debe seleccionar al menos un alumno." });
    }

    const requested_slots = student_ids.length;

    if (requested_slots > 4) {
      return res.status(400).json({ error: "Máximo 4 alumnos por taller." });
    }

    await client.query('BEGIN');

    // 1. Crear la Solicitud del Centro
    // Note: Request.create uses db.query which uses pool. We should use client here for transaction.
    // For simplicity, I'll allow Request.create to run outside transaction OR replicate logic here using client.
    // Replicating logic using client to ensure atomicity.
    const requestResult = await client.query(`
        INSERT INTO center_requests (id_center, id_workshop, requested_slots, comments, status)
        VALUES ($1, $2, $3, $4, 'PENDING')
        RETURNING *
    `, [id_center, id_workshop, requested_slots, comments]);
    
    const newRequest = requestResult.rows[0];

    // 2. Crear los intereses de los alumnos vinculados
    for (const studentId of student_ids) {
        await client.query(`
            INSERT INTO student_interest (id_student, id_workshop, verified_by_teacher_id, id_request, status)
            VALUES ($1, $2, NULL, $3, 'WAITING')
        `, [studentId, id_workshop, newRequest.id_request]);
    }

    await client.query('COMMIT');
    res.status(201).json(newRequest);

  } catch (error) {
    await client.query('ROLLBACK');
    console.error(error);
    // Handle unique constraint violation (student already interested) specially?
    if (error.code === '23505') {
        return res.status(400).json({ error: "Uno o más alumnos ya tienen una solicitud para este taller." });
    }
    res.status(500).json({ error: "Error creando la solicitud" });
  } finally {
    client.release();
  }
};

export const getMyRequests = async (req, res) => {
  try {
    const id_center = req.user.id;
    const requests = await Request.getByCenter(id_center);
    res.json(requests);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error fetching requests" });
  }
};
