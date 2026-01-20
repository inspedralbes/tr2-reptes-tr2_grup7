import express from "express";
import * as assignmentController from "../controllers/assignmentController.js";
import { verifyToken } from "../middleware/authMiddleware.js";

const router = express.Router();

router.post("/", verifyToken, assignmentController.triggerAssignment);
router.post("/match", verifyToken, assignmentController.runMatching);

export default router;
