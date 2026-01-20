import db from "../data/db.js";
import { io } from "../server.js";
import bcrypt from "bcrypt";
import * as Admin from "../models/admin.js";

export const getAdminStats = async (req, res) => {
  try {
    const stats = await Admin.getStats();
    res.json(stats);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error fetching admin stats" });
  }
};

export const getAllRequests = async (req, res) => {
  try {
    const requests = await Admin.getAllRequests();
    res.json(requests);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error fetching all requests" });
  }
};

export const getPendingRequests = async (req, res) => {
  try {
    const requests = await Admin.getPendingRequests();
    res.json(requests);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error fetching pending requests" });
  }
};

export const getRequestById = async (req, res) => {
  try {
    const { id } = req.params;
    
    const request = await Admin.getRequestById(id);
    if (!request) {
      return res.status(404).json({ error: "Request not found" });
    }
    
    const students = await Admin.getRequestStudents(id, request.id_workshop);
    
    res.json({
      ...request,
      students,
      total_students: students.length,
      accepted_students: students.filter(s => s.is_accepted).length
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error fetching request details" });
  }
};

export const getAvailableTeachers = async (req, res) => {
  try {
    const teachers = await Admin.getAvailableTeachers();
    res.json(teachers);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error fetching teachers" });
  }
};

export const getTopWorkshops = async (req, res) => {
  try {
    const workshops = await Admin.getTopWorkshops();
    res.json(workshops);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error fetching top workshops" });
  }
};

export const getAllCenters = async (req, res) => {
  try {
    const centers = await Admin.getAllCenters();
    res.json(centers);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error fetching centers" });
  }
};

export const acceptRequest = async (req, res) => {
  try {
    const { id } = req.params;
    await Admin.updateRequestStatus(id, 'ACCEPTED');

    io.emit("stats_updated");
    io.emit("request_status_updated", {
      id_request: parseInt(id),
      status: "ACCEPTED",
    });

    res.json({ message: "Request accepted successfully" });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error accepting request" });
  }
};

export const rejectRequest = async (req, res) => {
  try {
    const { id } = req.params;
    await Admin.updateRequestStatus(id, 'REJECTED');

    io.emit("stats_updated");

    res.json({ message: "Request rejected successfully" });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error rejecting request" });
  }
};

export const deleteRequest = async (req, res) => {
  try {
    const { id } = req.params;
    await Admin.deleteRequest(id);

    io.emit("stats_updated");

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
      if (!["PENDING", "ACCEPTED", "REJECTED"].includes(status)) {
        return res.status(400).json({ error: "Invalid status value" });
      }
      updates.push(`status = $${paramCount}`);
      values.push(status);
      paramCount++;
    }

    values.push(id);

    const query = `UPDATE center_requests SET ${updates.join(", ")} WHERE id_request = $${paramCount}`;
    await db.query(query, values);

    // Emitir evento Socket.io para actualizar dashboard
    io.emit("stats_updated");

    res.json({ message: "Request updated successfully" });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error updating request" });
  }
};

export const manualAssign = async (req, res) => {
  try {
    const { requestId, assignedSlots, teacher1Id, teacher2Id, comments } =
      req.body;

    // Aquí implementarías la lógica de asignación manual
    // Por ahora, solo actualizaremos el estado de la petición
    await Admin.updateRequestStatus(requestId, 'ACCEPTED');

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
    const result = await db.query(
      "UPDATE center_requests SET status = 'ACCEPTED' WHERE status = 'PENDING'",
    );

    res.json({
      message: "Auto assignment completed successfully",
      updatedRequests: result.rowCount,
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
      workshops: workshopsResult.rows,
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
      [email, id],
    );

    if (emailCheck.rows.length > 0) {
      return res.status(400).json({ error: "Email already in use" });
    }

    // Update teacher info
    await db.query(
      "UPDATE teachers SET first_name = $1, last_name = $2 WHERE id_user = $3",
      [first_name, last_name, id],
    );

    // Update user email
    await db.query("UPDATE users SET email = $1 WHERE id = $2", [email, id]);

    // Emitir evento Socket.io para actualizar en tiempo real
    io.emit("teacher_updated", { id_user: id });

    res.json({
      message: "Teacher updated successfully",
      teacher: { id_user: id, first_name, last_name, email },
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
        [centerIdValue],
      );

      if (centerCheck.rows.length === 0) {
        return res.status(404).json({ error: "Center not found" });
      }
    }

    // Update teacher's assigned center
    await db.query(
      "UPDATE teachers SET id_center_assigned = $1 WHERE id_user = $2",
      [centerIdValue, id],
    );

    // Emitir evento Socket.io para actualizar en tiempo real
    io.emit("teacher_updated", { id_user: id });

    res.json({
      message: centerIdValue
        ? "Center assigned successfully"
        : "Teacher unassigned from center",
      centerId: centerIdValue,
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
      [id],
    );

    if (currentStatus.rows.length === 0) {
      return res.status(404).json({ error: "User not found" });
    }

    const newStatus = !currentStatus.rows[0].is_active;

    // Toggle active status
    await db.query("UPDATE users SET is_active = $1 WHERE id = $2", [
      newStatus,
      id,
    ]);

    // Emitir evento Socket.io para actualizar en tiempo real
    io.emit("teacher_updated", { id_user: id });

    res.json({
      message: `Teacher ${newStatus ? "activated" : "deactivated"} successfully`,
      is_active: newStatus,
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error toggling teacher status" });
  }
};

// ============ USER MANAGEMENT ============

export const getAllUsers = async (req, res) => {
  try {
    const query = `
      SELECT id, role, email, is_active, created_at,
        CASE 
          WHEN role = 'CENTER' THEN (SELECT center_name FROM centers WHERE id_user = users.id)
          WHEN role = 'TEACHER' THEN (SELECT first_name || ' ' || last_name FROM teachers WHERE id_user = users.id)
          ELSE email
        END as name
      FROM users
      ORDER BY created_at DESC
    `;
    const result = await db.query(query);
    res.json(result.rows);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error fetching users" });
  }
};

export const createUser = async (req, res) => {
  try {
    // Basic User Creation (Admin usage)
    const { name, email, password, role } = req.body;
    
    if (!email || !password || !role) {
        return res.status(400).json({ error: "Missing required fields" });
    }

    // Check if email exists
    const userCheck = await db.query("SELECT id FROM users WHERE email = $1", [email]);
    if (userCheck.rows.length > 0) {
        return res.status(400).json({ error: "Email already exists" });
    }

    const hashedPassword = await bcrypt.hash(password, 10);
    
    // Insert into users
    const query = `
        INSERT INTO users (email, password_hash, role, is_active)
        VALUES ($1, $2, $3, true)
        RETURNING id, email, role
    `;
    const result = await db.query(query, [email, hashedPassword, role]);
    const newUser = result.rows[0];

    res.status(201).json(newUser);

  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error creating user" });
  }
};

export const updateUser = async (req, res) => {
  try {
    const { id } = req.params;
    const { email, role, is_active, password } = req.body;

    const updates = [];
    const values = [];
    let paramCount = 1;

    if (email !== undefined) { updates.push(`email = $${paramCount}`); values.push(email); paramCount++; }
    if (role !== undefined) { updates.push(`role = $${paramCount}`); values.push(role); paramCount++; }
    if (is_active !== undefined) { updates.push(`is_active = $${paramCount}`); values.push(is_active); paramCount++; }
    if (password !== undefined && password.trim() !== "") {
        const hashedPassword = await bcrypt.hash(password, 10);
        updates.push(`password_hash = $${paramCount}`); 
        values.push(hashedPassword); 
        paramCount++;
    }

    if (updates.length === 0) return res.status(400).json({ error: "No fields to update" });

    values.push(id);
    const query = `UPDATE users SET ${updates.join(", ")} WHERE id = $${paramCount} RETURNING id, email, role, is_active`;
    
    const result = await db.query(query, values);
    
    if (result.rows.length === 0) return res.status(404).json({ error: "User not found" });

    res.json(result.rows[0]);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error updating user" });
  }
};

export const deleteUser = async (req, res) => {
  try {
    const { id } = req.params;
    await db.query("DELETE FROM users WHERE id = $1", [id]);
    res.json({ message: "User deleted successfully" });
  } catch (error) {
    console.error("Delete user error:", error); 
    res.status(500).json({ error: "Error deleting user (check dependencies)" });
  }
};


