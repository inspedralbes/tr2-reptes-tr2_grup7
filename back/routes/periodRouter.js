import express from "express";
import * as periodController from "../controllers/periodController.js";
import { verifyToken, verifyAdmin } from "../middleware/authMiddleware.js";

const router = express.Router();

router.get("/", verifyToken, periodController.getAllPeriods);
router.get("/active", verifyToken, periodController.getActivePeriod); // Can be public? Or verified.
router.post("/", verifyToken, verifyAdmin, periodController.createPeriod);
router.put("/:id/close", verifyToken, verifyAdmin, periodController.closePeriod);

export default router;
