import * as Request from "../models/centerRequest.js";
import * as Centre from "../models/centre.js";

export const createRequest = async (req, res) => {
  try {
    const {
      id_workshop,
      requested_slots,
      comments,
      course_level,
      id_teacher,
      students, // Array of student IDs
    } = req.body;
    const id_center = req.user.id;

    // 1. Validate max limits
    const numStudents = students ? students.length : 0;
    if (numStudents > 4) {
      return res
        .status(400)
        .json({ error: "Max 4 students per request allowed." });
    }

    // 2. Validate requested_slots matches (or just use numStudents)
    // If requested_slots is provided, check consistency, or just overwrite/default?
    // Let's use requested_slots if provided, but ensure it's >= numStudents.
    // Actually, if we are sending specific students, requested_slots IS student length.
    // But maybe they want extra slots? "solicitud del taller sean maximo de 4 alumnos".
    // Implies max 4 slots.
    if (requested_slots > 4) {
      return res.status(400).json({ error: "Max slots per request is 4" });
    }

    // 3. Validate students belong to center
    if (numStudents > 0) {
      const validStudents = await Centre.checkStudentsBelongToCenter(
        id_center,
        students
      );
      if (!validStudents) {
        return res.status(403).json({
          error: "One or more students do not belong to this center.",
        });
      }
    }

    const newRequest = await Request.create(
      id_center,
      id_workshop,
      requested_slots || numStudents, // Use specific count or fallback
      comments,
      numStudents, // student_count
      course_level,
      id_teacher,
      students
    );
    res.status(201).json(newRequest);
  } catch (error) {
    console.error(error);
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
