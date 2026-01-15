import db from "../data/db.js";
import { io } from "../server.js";

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

export const getAllCenters = async (req, res) => {
  try {
    const query = `
      SELECT c.id_user, c.center_name, c.center_code, u.email, u.is_active
      FROM centers c
      JOIN users u ON c.id_user = u.id
      WHERE u.is_active = true
      ORDER BY c.center_name ASC
    `;
    const result = await db.query(query);
    res.json(result.rows);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error fetching centers" });
  }
};


export const acceptRequest = async (req, res) => {
  try {
    const { id } = req.params;
    await db.query("UPDATE center_requests SET status = 'ACCEPTED' WHERE id_request = $1", [id]);
    
    // Emitir evento Socket.io para actualizar dashboard
    io.emit('stats_updated');
    
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
    
    // Emitir evento Socket.io para actualizar dashboard
    io.emit('stats_updated');
    
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
    
    // Emitir evento Socket.io para actualizar dashboard
    io.emit('stats_updated');
    
    res.json({ message: "Request deleted successfully" });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error deleting request" });
  }
};

export const updateRequest = async (req, res) => {
  try {
    const { id } = req.params;
    const { requested_slots, status } = req.body;
    
    // Validate input
    if (!requested_slots && !status) {
      return res.status(400).json({ error: "No fields to update" });
    }
    
    // Build dynamic update query
    const updates = [];
    const values = [];
    let paramCount = 1;
    
    if (requested_slots !== undefined) {
      updates.push(`requested_slots = $${paramCount}`);
      values.push(requested_slots);
      paramCount++;
    }
    
    if (status !== undefined) {
      // Validate status
      if (!['PENDING', 'ACCEPTED', 'REJECTED'].includes(status)) {
        return res.status(400).json({ error: "Invalid status value" });
      }
      updates.push(`status = $${paramCount}`);
      values.push(status);
      paramCount++;
    }
    
    values.push(id);
    
    const query = `UPDATE center_requests SET ${updates.join(', ')} WHERE id_request = $${paramCount}`;
    await db.query(query, values);
    
    // Emitir evento Socket.io para actualizar dashboard
    io.emit('stats_updated');
    
    res.json({ message: "Request updated successfully" });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error updating request" });
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

// ============ TEACHER MANAGEMENT ============

export const getTeacherById = async (req, res) => {
  try {
    const { id } = req.params;
    
    // Get teacher details with user info and assigned center
    const query = `
      SELECT 
        t.id_user,
        t.first_name,
        t.last_name,
        t.id_center_assigned,
        u.email,
        u.is_active,
        c.center_name,
        c.center_code
      FROM teachers t
      JOIN users u ON t.id_user = u.id
      LEFT JOIN centers c ON t.id_center_assigned = c.id_user
      WHERE t.id_user = $1
    `;
    
    const result = await db.query(query, [id]);
    
    if (result.rows.length === 0) {
      return res.status(404).json({ error: "Teacher not found" });
    }
    
    // Get assigned workshops
    const workshopsQuery = `
      SELECT w.id_workshop, w.title, w.start_date, w.end_date, w.status
      FROM workshops w
      JOIN workshop_teachers wt ON w.id_workshop = wt.id_workshop
      WHERE wt.id_teacher = $1
      ORDER BY w.start_date DESC
    `;
    
    const workshopsResult = await db.query(workshopsQuery, [id]);
    
    const teacher = {
      ...result.rows[0],
      workshops: workshopsResult.rows
    };
    
    res.json(teacher);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error fetching teacher details" });
  }
};

export const updateTeacher = async (req, res) => {
  try {
    const { id } = req.params;
    const { first_name, last_name, email } = req.body;
    
    // Validate input
    if (!first_name || !last_name || !email) {
      return res.status(400).json({ error: "Missing required fields" });
    }
    
    // Check if email is already taken by another user
    const emailCheck = await db.query(
      "SELECT id FROM users WHERE email = $1 AND id != $2",
      [email, id]
    );
    
    if (emailCheck.rows.length > 0) {
      return res.status(400).json({ error: "Email already in use" });
    }
    
    // Update teacher info
    await db.query(
      "UPDATE teachers SET first_name = $1, last_name = $2 WHERE id_user = $3",
      [first_name, last_name, id]
    );
    
    // Update user email
    await db.query(
      "UPDATE users SET email = $1 WHERE id = $2",
      [email, id]
    );
    
    res.json({ 
      message: "Teacher updated successfully",
      teacher: { id_user: id, first_name, last_name, email }
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error updating teacher" });
  }
};

export const assignCenterToTeacher = async (req, res) => {
  try {
    const { id } = req.params;
    const { centerId } = req.body;
    
    // If centerId is null or empty, unassign the teacher
    const centerIdValue = centerId || null;
    
    // Verify center exists if centerId is provided
    if (centerIdValue) {
      const centerCheck = await db.query(
        "SELECT id_user FROM centers WHERE id_user = $1",
        [centerIdValue]
      );
      
      if (centerCheck.rows.length === 0) {
        return res.status(404).json({ error: "Center not found" });
      }
    }
    
    // Update teacher's assigned center
    await db.query(
      "UPDATE teachers SET id_center_assigned = $1 WHERE id_user = $2",
      [centerIdValue, id]
    );
    
    res.json({ 
      message: centerIdValue 
        ? "Center assigned successfully" 
        : "Teacher unassigned from center",
      centerId: centerIdValue
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error assigning center" });
  }
};

export const toggleTeacherActive = async (req, res) => {
  try {
    const { id } = req.params;
    
    // Get current status
    const currentStatus = await db.query(
      "SELECT is_active FROM users WHERE id = $1",
      [id]
    );
    
    if (currentStatus.rows.length === 0) {
      return res.status(404).json({ error: "User not found" });
    }
    
    const newStatus = !currentStatus.rows[0].is_active;
    
    // Toggle active status
    await db.query(
      "UPDATE users SET is_active = $1 WHERE id = $2",
      [newStatus, id]
    );
    
    res.json({ 
      message: `Teacher ${newStatus ? 'activated' : 'deactivated'} successfully`,
      is_active: newStatus
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error toggling teacher status" });
  }
};