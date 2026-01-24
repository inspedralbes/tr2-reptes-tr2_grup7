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
      accepted_students: students.filter((s) => s.is_accepted).length,
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

// Helper to assign teachers to a workshop
const assignTeachersToWorkshop = async (id_workshop, teacherIds) => {
  if (!id_workshop || !teacherIds || teacherIds.length === 0) return;

  for (const teacherId of teacherIds) {
    if (teacherId) {
      await db.query(
        "INSERT INTO workshop_teachers (id_workshop, id_teacher) VALUES ($1, $2) ON CONFLICT DO NOTHING",
        [id_workshop, teacherId],
      );
    }
  }
};

export const acceptRequest = async (req, res) => {
  try {
    const { id } = req.params;

    // 1. Get Request Details to find teachers and workshop
    const request = await Admin.getRequestById(id);
    if (!request) {
      return res.status(404).json({ error: "Request not found" });
    }

    // 2. Assign Teachers
    const teachersToAssign = [];
    if (request.id_teacher_1) teachersToAssign.push(request.id_teacher_1);
    if (request.id_teacher_2) teachersToAssign.push(request.id_teacher_2);

    await assignTeachersToWorkshop(request.id_workshop, teachersToAssign);

    // 3. Update Status
    await Admin.updateRequestStatus(id, "ACCEPTED");

    io.emit("stats_updated");
    io.emit("request_status_updated", {
      id_request: parseInt(id),
      status: "ACCEPTED",
    });

    res.json({
      message: "Request accepted and teachers assigned successfully",
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error accepting request" });
  }
};

export const rejectRequest = async (req, res) => {
  try {
    const { id } = req.params;
    await Admin.updateRequestStatus(id, "REJECTED");

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

export const manageRequestStudents = async (req, res) => {
  try {
    const { id } = req.params;
    const { acceptedStudents } = req.body; // Array of student IDs to accept

    // 1. Get Request Details (including Workshop ID and Associated Teachers)
    const request = await Admin.getRequestById(id);
    if (!request) return res.status(404).json({ error: "Request not found" });

    // 2. Validate Workshop Capacity
    // Get current enrollment count (excluding students from THIS request to allow re-evaluation?)
    // Actually, enrollment table handles unique students. simpler to check capacity.
    const workshopResult = await db.query(
      "SELECT max_slots, available_slots, id_workshop FROM workshops WHERE id_workshop = $1",
      [request.id_workshop],
    );
    const workshop = workshopResult.rows[0];

    // Calculate REAL available slots (excluding current enrollments for THIS request if any, tricky)
    // Simplified: Check if we are ADDING more students than available.
    // Better: Get current enrollment count.
    const enrollCountRes = await db.query(
      "SELECT COUNT(*) FROM workshop_enrollments WHERE id_workshop = $1",
      [request.id_workshop],
    );
    const currentEnrolled = parseInt(enrollCountRes.rows[0].count);

    // We need to know which students from THIS request are ALREADY enrolled to calculate net change.
    const requestStudents = await Admin.getRequestStudents(
      id,
      request.id_workshop,
    );
    const currentlyAcceptedCount = requestStudents.filter(
      (s) => s.is_accepted,
    ).length;

    const newCount = acceptedStudents.length;
    const netChange = newCount - currentlyAcceptedCount;

    // available_slots in DB might be stale or tricky. Let's use max - currentEnrolled
    const realAvailable = workshop.max_slots - currentEnrolled;

    // If we are increasing count, check if we have space
    if (netChange > 0 && netChange > realAvailable) {
      return res.status(400).json({
        error: `Not enough slots. Available: ${realAvailable}, Trying to add: ${netChange}`,
      });
    }

    // 3. Update Students
    for (const student of requestStudents) {
      const isNowAccepted = acceptedStudents.includes(student.id_user);

      // Only update if changed (optimization) or just enforce always
      await Admin.setStudentAcceptedStatus(
        id,
        student.id_user,
        isNowAccepted,
        request.id_workshop,
      );
    }

    // 4. Update Request Status (PARTIAL, ACCEPTED, REJECTED)
    const finalCount = newCount;
    const totalRequestStudents = requestStudents.length;
    let newStatus = "PENDING";

    if (finalCount === 0)
      newStatus = "REJECTED"; // Or PENDING if just reset? But usually rejected if processed.
    else if (finalCount === totalRequestStudents) newStatus = "ACCEPTED";
    else newStatus = "PARTIAL";

    await Admin.updateRequestStatus(id, newStatus);

    // 5. Force specific status in DB for rejected? No, logic above handles it.

    // 6. AUTO-ASSIGN TEACHERS TO WORKSHOP
    // If at least one student is accepted, ensure teachers are assigned
    if (finalCount > 0) {
      console.log(
        `[AutoAssign] Request ${id}: Accepted students > 0. Checking teachers...`,
      );

      const teachersToAssign = [];
      if (request.id_teacher_1) teachersToAssign.push(request.id_teacher_1);
      if (request.id_teacher_2) teachersToAssign.push(request.id_teacher_2);

      if (teachersToAssign.length > 0) {
        await assignTeachersToWorkshop(request.id_workshop, teachersToAssign);
        console.log(
          `[AutoAssign] Assigned teachers [${teachersToAssign.join(", ")}] to Workshop ${request.id_workshop}`,
        );
      }

      // Force workshop status update (optional, but good practice)
      await db.query(
        `UPDATE workshops SET available_slots = max_slots - (SELECT COUNT(*) FROM workshop_enrollments WHERE id_workshop = $1) WHERE id_workshop = $1`,
        [request.id_workshop],
      );
    } else {
      console.log(
        `[AutoAssign] Request ${id}: No accepted students. Skipping teacher assignment.`,
      );
    }

    io.emit("stats_updated");
    io.emit("request_status_updated", { id_request: id, status: newStatus });

    res.json({ message: "Students updated successfully", status: newStatus });
  } catch (error) {
    console.error("[manageRequestStudents] Error:", error);
    res.status(500).json({ error: "Error updating request students" });
  }
};

export const manualAssign = async (req, res) => {
  try {
    const { requestId, assignedSlots, teacher1Id, teacher2Id, comments } =
      req.body;

    // 1. Validate Slots
    if (
      assignedSlots !== undefined &&
      assignedSlots !== null &&
      assignedSlots !== ""
    ) {
      const slots = parseInt(assignedSlots);
      if (isNaN(slots) || slots < 1 || slots > 4) {
        return res
          .status(400)
          .json({ error: "Les places hauríen de ser entre 1 i 4 (manual)." });
      }
      // Update request slots
      await db.query(
        "UPDATE center_requests SET requested_slots = $1 WHERE id_request = $2",
        [slots, requestId],
      );
    }

    // 2. Get Request to find workshop ID
    const request = await Admin.getRequestById(requestId);
    if (!request) {
      return res.status(404).json({ error: "Request not found" });
    }

    // 3. Assign Teachers
    const teachersToAssign = [];
    if (teacher1Id) teachersToAssign.push(teacher1Id);
    if (teacher2Id) teachersToAssign.push(teacher2Id);

    if (teachersToAssign.length > 0) {
      await assignTeachersToWorkshop(request.id_workshop, teachersToAssign);
    }

    // 4. Update Request Status
    await Admin.updateRequestStatus(requestId, "ACCEPTED");

    // 5. Recalculate available slots just in case
    await db.query(
      `UPDATE workshops SET available_slots = max_slots - (SELECT COUNT(*) FROM workshop_enrollments WHERE id_workshop = $1) WHERE id_workshop = $1`,
      [request.id_workshop],
    );

    res.json({
      message: "Assignment completed and teachers assigned successfully",
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error in manual assignment" });
  }
};

export const autoAssign = async (req, res) => {
  try {
    // 1. Get all pending requests
    const pendingRequests = await Admin.getPendingRequests();

    // 2. For each request, assign its default teachers
    let updatedCount = 0;

    for (const req of pendingRequests) {
      const teachersToAssign = [];
      // Note: Admin.getPendingRequests join result might need checking column names.
      // Looking at model: SELECT cr.*, c.center_name, ... FROM ...
      // It DOES NOT select id_teacher_1/2. We need to fetch full details or update query.
      // Let's safe fetch details for each to get teachers.
      const fullReq = await Admin.getRequestById(req.id_request);

      if (fullReq) {
        if (fullReq.id_teacher_1) teachersToAssign.push(fullReq.id_teacher_1);
        if (fullReq.id_teacher_2) teachersToAssign.push(fullReq.id_teacher_2);

        await assignTeachersToWorkshop(fullReq.id_workshop, teachersToAssign);
        await Admin.updateRequestStatus(req.id_request, "ACCEPTED");
        updatedCount++;
      }
    }

    res.json({
      message: "Auto assignment completed successfully",
      updatedRequests: updatedCount,
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
    const userCheck = await db.query("SELECT id FROM users WHERE email = $1", [
      email,
    ]);
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

    if (email !== undefined) {
      updates.push(`email = $${paramCount}`);
      values.push(email);
      paramCount++;
    }
    if (role !== undefined) {
      updates.push(`role = $${paramCount}`);
      values.push(role);
      paramCount++;
    }
    if (is_active !== undefined) {
      updates.push(`is_active = $${paramCount}`);
      values.push(is_active);
      paramCount++;
    }
    if (password !== undefined && password.trim() !== "") {
      const hashedPassword = await bcrypt.hash(password, 10);
      updates.push(`password_hash = $${paramCount}`);
      values.push(hashedPassword);
      paramCount++;
    }

    if (updates.length === 0)
      return res.status(400).json({ error: "No fields to update" });

    values.push(id);
    const query = `UPDATE users SET ${updates.join(", ")} WHERE id = $${paramCount} RETURNING id, email, role, is_active`;

    const result = await db.query(query, values);

    if (result.rows.length === 0)
      return res.status(404).json({ error: "User not found" });

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
