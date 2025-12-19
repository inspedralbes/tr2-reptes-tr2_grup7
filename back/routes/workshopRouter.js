import express from "express";
import * as workshopController from "../controllers/workshopController.js";

const router = express.Router();

// La ruta base será /api/tallers (definida en server.js)
router.get("/", workshopController.getAllWorkshops);
router.get("/:id", workshopController.getWorkshopById);
router.post("/", workshopController.createWorkshop);
router.put("/:id", workshopController.updateWorkshop);
router.delete("/:id", workshopController.deleteWorkshop);

// Legacy endpoints removed. Use /api/requests
// router.post("/request", workshopController.createRequest);
// router.post("/assign", workshopController.assignTeachersToRequests);

export default router;
