import * as Request from "../models/centerRequest.js";
import * as Interest from "../models/interest.js";
import db from "../data/db.js"; // Import db for transactions
import * as Centre from "../models/centre.js";

// Helper to find or create an application for the current year
const getOrCreateApplication = async (id_center) => {
  // Priority: Reuse ANY existing DRAFT application for this center
  const resDraft = await db.query(
    "SELECT * FROM school_applications WHERE id_center = $1 AND status = 'DRAFT' ORDER BY created_at DESC LIMIT 1",
    [id_center]
  );
  if (resDraft.rows.length > 0) return resDraft.rows[0];

  // If no draft exists, create a new one.
  // Ensure we don't violate UNIQUE(id_center, year_period)
  const now = new Date();
  const currentYear = now.getFullYear();
  let period =
    now.getMonth() > 7
      ? `${currentYear}-${currentYear + 1}`
      : `${currentYear - 1}-${currentYear}`;

  // Check if period exists
  let exists = true;
  let suffix = 1;
  let finalPeriod = period;

  while (exists) {
    const checkRes = await db.query(
      "SELECT 1 FROM school_applications WHERE id_center = $1 AND year_period = $2",
      [id_center, finalPeriod]
    );
    if (checkRes.rowCount === 0) {
      exists = false;
    } else {
      suffix++;
      finalPeriod = `${period}-v${suffix}`;
    }
  }

  const insertRes = await db.query(
    "INSERT INTO school_applications (id_center, year_period, status) VALUES ($1, $2, 'DRAFT') RETURNING *",
    [id_center, finalPeriod]
  );
  return insertRes.rows[0];
};

export const createRequest = async (req, res) => {
  try {
    const id_center = req.user.id;
    const app = await getOrCreateApplication(id_center);

    const requestData = {
      ...req.body,
      id_application: app.id_application,
      student_count: req.body.students ? req.body.students.length : 0,
    };

    const newRequest = await Request.create(requestData);
    res.status(201).json(newRequest);
  } catch (error) {
    console.error("Error creating request:", error);
    res.status(500).json({ error: "Error creating request" });
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
export const getAllRequests = async (req, res) => {
  try {
    const requests = await Request.getAllPending(); // O una función que traiga todas
    res.json(requests);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error fetching all requests" });
  }
};
