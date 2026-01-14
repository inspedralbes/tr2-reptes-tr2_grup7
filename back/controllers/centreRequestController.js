import * as Request from "../models/centerRequest.js";

export const createRequest = async (req, res) => {
  try {
    const {
      id_workshop,
      requested_slots,
      comments,
      student_count,
      course_level,
      id_teacher,
    } = req.body;
    const id_center = req.user.id;

    if (requested_slots > 4) {
      return res.status(400).json({ error: "Max slots per request is 4" });
    }

    const newRequest = await Request.create(
      id_center,
      id_workshop,
      requested_slots,
      comments,
      student_count,
      course_level,
      id_teacher
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
