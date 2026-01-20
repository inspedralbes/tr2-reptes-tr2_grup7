import * as Period from "../models/period.js";
import db from "../data/db.js";

//L'arxiu parla directament amb la base de dades es a dir fa com intermediari
export const createPeriod = async (req, res) => {
  try {
    const { name, start_date, end_date } = req.body;

    // Validation: Verify dates, etc.
    // Check if another period is open?
    const active = await Period.getActive();
    if (active) {
      return res.status(400).json({
        error:
          "Ya existe un periodo abierto. ciérralo antes de abrir uno nuevo.",
      });
    }

    const newPeriod = await Period.create(name, start_date, end_date);
    res.status(201).json(newPeriod);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error creando el periodo" });
  }
};

export const getAllPeriods = async (req, res) => {
  try {
    const periods = await Period.getAll();
    res.json(periods);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error obteniendo periodos" });
  }
};

export const getActivePeriod = async (req, res) => {
  try {
    const period = await Period.getActive();
    if (!period) return res.json(null); // No active period is valid state
    res.json(period);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error obteniendo periodo activo" });
  }
};

export const closePeriod = async (req, res) => {
  const client = await db.connect();
  try {
    const { id } = req.params;

    // 1. Start Transaction
    await client.query("BEGIN");

    // 2. Close the Period
    const updateText = `UPDATE application_periods SET status = 'CLOSED' WHERE id_period = $1 RETURNING *`;
    const updatedPeriodRes = await client.query(updateText, [id]);

    if (updatedPeriodRes.rows.length === 0) {
      await client.query("ROLLBACK");
      return res.status(404).json({ error: "Periodo no encontrado" });
    }

    // 3. AUTO-REJECT LOGIC
    // Find all requests in this period that are still PENDING
    // Structure: Period -> SchoolApplication -> CenterRequest

    const rejectQuery = `
            UPDATE center_requests cr
            SET status = 'REJECTED',
                comments = COALESCE(comments, '') || ' [Auto-Rechazo: Convocatoria cerrada sin asignación]'
            FROM school_applications sa
            WHERE cr.id_application = sa.id_application
              AND sa.id_period = $1
              AND cr.status = 'PENDING'
            RETURNING cr.id_request
        `;

    const rejectionResult = await client.query(rejectQuery, [id]);

    await client.query("COMMIT");

    console.log(
      `🔒 Periodo ${id} cerrado. ${rejectionResult.rowCount} solicitudes pendientes han sido rechazadas.`,
    );

    res.json({
      period: updatedPeriodRes.rows[0],
      rejected_count: rejectionResult.rowCount,
      message: `Periodo cerrado. ${rejectionResult.rowCount} solicitudes rechazadas automáticamente.`,
    });
  } catch (error) {
    await client.query("ROLLBACK");
    console.error(error);
    res.status(500).json({ error: "Error cerrando periodo" });
  } finally {
    client.release();
  }
};
