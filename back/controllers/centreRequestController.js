import * as Request from "../models/centerRequest.js";
import * as Interest from "../models/interest.js";
import db from "../data/db.js"; // Import db for transactions
import * as Centre from "../models/centre.js";



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
