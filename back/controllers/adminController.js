import db from "../data/db.js";

export const getAdminStats = async (req, res) => {
  try {
    // Total peticiones
    const totalRequestsResult = await db.query("SELECT COUNT(*) as total FROM center_requests");
    const totalRequests = parseInt(totalRequestsResult.rows[0].total);

    // Peticiones asignadas (aceptadas)
    const assignedRequestsResult = await db.query("SELECT COUNT(*) as assigned FROM center_requests WHERE status = 'ACCEPTED'");
    const assignedRequests = parseInt(assignedRequestsResult.rows[0].assigned);

    // Peticiones pendientes
    const pendingRequestsResult = await db.query("SELECT COUNT(*) as pending FROM center_requests WHERE status = 'PENDING'");
    const pendingRequests = parseInt(pendingRequestsResult.rows[0].pending);

    // Centros activos
    const activeCentersResult = await db.query("SELECT COUNT(*) as active_centers FROM centers c JOIN users u ON c.id_user = u.id WHERE u.is_active = true");
    const activeCenters = parseInt(activeCentersResult.rows[0].active_centers);

    res.json({
      totalRequests,
      assignedRequests,
      pendingRequests,
      activeCenters
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error fetching admin stats" });
  }
};

export const getAllRequests = async (req, res) => {
  try {
    const query = `
      SELECT cr.*, c.center_name, w.title as workshop_title, w.start_date, w.end_date
      FROM center_requests cr
      JOIN centers c ON cr.id_center = c.id_user
      JOIN workshops w ON cr.id_workshop = w.id_workshop
      ORDER BY cr.created_at DESC
    `;
    const result = await db.query(query);
    res.json(result.rows);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error fetching all requests" });
  }
};

export const getPendingRequests = async (req, res) => {
  try {
    const query = `
      SELECT cr.*, c.center_name, w.title as workshop_title, w.start_date, w.end_date
      FROM center_requests cr
      JOIN centers c ON cr.id_center = c.id_user
      JOIN workshops w ON cr.id_workshop = w.id_workshop
      WHERE cr.status = 'PENDING'
      ORDER BY cr.created_at DESC
    `;
    const result = await db.query(query);
    res.json(result.rows);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error fetching pending requests" });
  }
};

export const getAvailableTeachers = async (req, res) => {
  try {
    const query = `
      SELECT t.id_user, t.first_name, t.last_name, u.email, c.center_name
      FROM teachers t
      JOIN users u ON t.id_user = u.id
      LEFT JOIN centers c ON t.id_center_assigned = c.id_user
      WHERE u.is_active = true
    `;
    const result = await db.query(query);
    res.json(result.rows);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error fetching teachers" });
  }
};

export const getTopWorkshops = async (req, res) => {
  try {
    const query = `
      SELECT w.title, COUNT(cr.id_request) as request_count
      FROM workshops w
      LEFT JOIN center_requests cr ON w.id_workshop = cr.id_workshop
      GROUP BY w.id_workshop, w.title
      ORDER BY request_count DESC
      LIMIT 10
    `;
    const result = await db.query(query);
    res.json(result.rows);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error fetching top workshops" });
  }
};

export const acceptRequest = async (req, res) => {
  try {
    const { id } = req.params;
    await db.query("UPDATE center_requests SET status = 'ACCEPTED' WHERE id_request = $1", [id]);
    res.json({ message: "Request accepted successfully" });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error accepting request" });
  }
};

export const rejectRequest = async (req, res) => {
  try {
    const { id } = req.params;
    await db.query("UPDATE center_requests SET status = 'REJECTED' WHERE id_request = $1", [id]);
    res.json({ message: "Request rejected successfully" });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error rejecting request" });
  }
};

export const deleteRequest = async (req, res) => {
  try {
    const { id } = req.params;
    await db.query("DELETE FROM center_requests WHERE id_request = $1", [id]);
    res.json({ message: "Request deleted successfully" });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error deleting request" });
  }
};

export const manualAssign = async (req, res) => {
  try {
    const { requestId, assignedSlots, teacher1Id, teacher2Id, comments } = req.body;

    // Aquí implementarías la lógica de asignación manual
    // Por ahora, solo actualizaremos el estado de la petición
    await db.query("UPDATE center_requests SET status = 'ACCEPTED' WHERE id_request = $1", [requestId]);

    // Podrías crear registros en workshop_teachers o alguna tabla de asignaciones
    // Por simplicidad, solo cambiamos el estado

    res.json({ message: "Assignment completed successfully" });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error in manual assignment" });
  }
};

export const autoAssign = async (req, res) => {
  try {
    // Lógica simple de asignación automática: aceptar todas las peticiones pendientes
    const result = await db.query("UPDATE center_requests SET status = 'ACCEPTED' WHERE status = 'PENDING'");

    res.json({
      message: "Auto assignment completed successfully",
      updatedRequests: result.rowCount
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error in auto assignment" });
  }
};