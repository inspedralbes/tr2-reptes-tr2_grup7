import express from "express";
import * as assignmentController from "../controllers/assignmentController.js";
import { verifyToken } from "../middleware/authMiddleware.js";

const router = express.Router();

router.post("/", verifyToken, assignmentController.triggerAssignment);
router.post("/run-matching", verifyToken, assignmentController.runMatching);
router.post("/confirm-matching", verifyToken, assignmentController.confirmMatching);

export default router;
