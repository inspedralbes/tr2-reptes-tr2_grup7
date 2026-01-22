import db from "../data/db.js";

export const getAll = async () => {
  const text = `
    SELECT c.*, u.email, u.is_active 
    FROM centers c 
    JOIN users u ON c.id_user = u.id
  `;
  const result = await db.query(text);
  return result.rows;
};

export const getById = async (id) => {
  const text = `
    SELECT c.*, u.email, u.is_active 
    FROM centers c 
    JOIN users u ON c.id_user = u.id 
    WHERE c.id_user = $1
  `;
  const result = await db.query(text, [id]);
  return result.rows[0];
};

export const getTeachersByCenter = async (id_center) => {
  const text = `
    SELECT t.*, u.email, u.is_active
    FROM teachers t
    JOIN users u ON t.id_user = u.id
    WHERE t.id_center_assigned = $1
  `;
  const result = await db.query(text, [id_center]);
  return result.rows;
};

export const getStudentsByCenter = async (id_center) => {
  const text = `
    SELECT s.*, u.email, u.is_active
    FROM students s
    JOIN users u ON s.id_user = u.id
    WHERE s.id_center_assigned = $1
    ORDER BY s.last_name, s.first_name
  `;
  const result = await db.query(text, [id_center]);
  return result.rows;
};

export const getDashboardStats = async (id_center) => {
  const studentsQuery =
    "SELECT COUNT(*) FROM students WHERE id_center_assigned = $1";
  const requestsQuery = `SELECT cr.status, COUNT(*) 
     FROM center_requests cr
     JOIN school_applications sa ON cr.id_application = sa.id_application
     WHERE sa.id_center = $1 
     GROUP BY cr.status`;

  const [studentsRes, requestsRes] = await Promise.all([
    db.query(studentsQuery, [id_center]),
    db.query(requestsQuery, [id_center]),
  ]);

  const studentCount = parseInt(studentsRes.rows[0].count, 10);
  const requestStats = requestsRes.rows;

  // Estadístiques per a la pàgina d'assignacions del centre
  let pending = 0;
  let accepted = 0;
  let rejected = 0;
  let partial = 0;

  requestStats.forEach((row) => {
    const count = parseInt(row.count, 10);
    if (row.status === "PENDING") pending += count;
    else if (row.status === "ACCEPTED") accepted += count;
    else if (row.status === "REJECTED") rejected += count;
    else if (row.status === "PARTIAL") partial += count; // Assignacions parcialment acceptades
  });

  return {
    student_count: studentCount,
    requests_pending: pending,
    requests_accepted: accepted,
    requests_rejected: rejected,
    requests_partial: partial,
    requests_active: pending + accepted + partial,
    total_assignments: accepted + partial, // Calculate on backend
  };
};

export const getTopWorkshopsForCenter = async (id_center) => {
  const query = `
    SELECT w.title, w.id_workshop, COUNT(cr.id_request) as request_count
    FROM center_requests cr
    JOIN school_applications sa ON cr.id_application = sa.id_application
    JOIN workshops w ON cr.id_workshop = w.id_workshop
    WHERE sa.id_center = $1
    GROUP BY w.id_workshop, w.title
    ORDER BY request_count DESC
    LIMIT 5
  `;
  const result = await db.query(query, [id_center]);
  return result.rows;
};

export const getUpcomingWorkshopsForCenter = async (id_center) => {
  const query = `
    SELECT DISTINCT 
      w.id_workshop,
      w.title,
      w.start_date,
      w.end_date,
      w.category,
      cr.status,
      (SELECT COUNT(*) FROM workshop_enrollments we WHERE we.id_workshop = w.id_workshop) as enrolled_count
    FROM workshops w
    JOIN center_requests cr ON w.id_workshop = cr.id_workshop
    JOIN school_applications sa ON cr.id_application = sa.id_application
    WHERE sa.id_center = $1 
      AND w.start_date > NOW()
      AND cr.status IN ('ACCEPTED', 'PARTIAL')
    ORDER BY w.start_date ASC
    LIMIT 5
  `;
  const result = await db.query(query, [id_center]);
  return result.rows;
};

// Use User.create for creating new centers (handles transaction)
// This method is kept for specific cases where user exists but center doesn't (unlikely)
export const create = async (centre) => {
  const { id_user, center_name, center_code, address, phone } = centre;
  const text = `
    INSERT INTO centers (id_user, center_name, center_code, address, phone)
    VALUES ($1, $2, $3, $4, $5)
    RETURNING *
  `;
  const values = [id_user, center_name, center_code, address, phone];
  const result = await db.query(text, values);
  return result.rows[0];
};

export const update = async (id, centre) => {
  const { center_name, center_code, address, phone } = centre;
  const text = `
    UPDATE centers
    SET center_name = $1, center_code = $2, address = $3, phone = $4
    WHERE id_user = $5
    RETURNING *
  `;
  const values = [center_name, center_code, address, phone, id];
  const result = await db.query(text, values);
  return result.rows[0];
};

export const remove = async (id) => {
  // Primero eliminamos las solicitudes del centro para evitar errores de FK
  // Primero eliminamos las solicitudes del centro para evitar errores de FK
  await db.query("DELETE FROM school_applications WHERE id_center = $1", [id]);

  // Deleting the user will cascade delete the center
  const text = "DELETE FROM users WHERE id = $1 RETURNING *";
  const result = await db.query(text, [id]);
  return result.rows[0];
};

export const checkStudentsBelongToCenter = async (id_center, studentIds) => {
  if (!studentIds || studentIds.length === 0) return true;
  const text = `
    SELECT COUNT(*) 
    FROM students 
    WHERE id_center_assigned = $1 AND id_user = ANY($2)
  `;
  const result = await db.query(text, [id_center, studentIds]);
  const count = parseInt(result.rows[0].count, 10);
  return count === studentIds.length;
};

export const updateTeacher = async (teacherId, data) => {
  const { first_name, last_name, email } = data;

  // Start transaction
  const client = await db.connect();
  try {
    await client.query("BEGIN");

    // Update teacher details
    await client.query(
      "UPDATE teachers SET first_name = $1, last_name = $2 WHERE id_user = $3",
      [first_name, last_name, teacherId],
    );

    // Update user email
    await client.query("UPDATE users SET email = $1 WHERE id = $2", [
      email,
      teacherId,
    ]);

    await client.query("COMMIT");
    return { id_user: teacherId, first_name, last_name, email };
  } catch (error) {
    await client.query("ROLLBACK");
    throw error;
  } finally {
    client.release();
  }
};

export const deleteTeacher = async (teacherId) => {
  // Deleting from users table cascades to teachers table
  const text = "DELETE FROM users WHERE id = $1 RETURNING id";
  const result = await db.query(text, [teacherId]);
  return result.rows[0];
};
