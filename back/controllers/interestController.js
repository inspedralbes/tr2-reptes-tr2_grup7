import * as Interest from "../models/interest.js";

export const createInterest = async (req, res) => {
  try {
    const { id_student, id_request } = req.body;
    const teacher_id = req.user.id; // From auth middleware

    // Optional: Check if req.user.role === 'TEACHER'

    const newInterest = await Interest.create(
      id_student,
      teacher_id,
      id_request
    );
    res.status(201).json(newInterest);
  } catch (error) {
    console.error(error);
    if (error.code === "23505") {
      // Unique constraint violation
      return res.status(409).json({ error: "Interest already exists" });
    }
    res.status(500).json({ error: "Error creating interest" });
  }
};
// con esto el centro puede ver los alumnos que quieren un taller
export const getInterestsByCenter = async (req, res) => {
  try {
    // Assuming the Center user is logged in, or we pass center ID.
    // If logged in as Center, req.user.id is the center ID (because in our schema, Center ID = User ID).
    // If logged in as Teacher, maybe we want to see interests of their center?
    // Let's assume for now this is called by the Center Admin.

    // However, `req.user.id` is the `id_user`.
    // If role is CENTER, that is the `id_center`.
    // If role is TEACHER, we might need to look up their assigned center?
    // Let's stick to the prompt: "Phase 2: Decision del Centro". Center looks at it.

    let centerId = req.user.id;

    // Quick fallback if a teacher wants to see it?
    // For now, assume usage by Center.

    const interests = await Interest.getByCenter(centerId);
    res.json(interests);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error fetching interests" });
  }
};
