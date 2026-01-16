import express from "express";
import * as evaluationController from "../controllers/evaluationController.js";
import { verifyToken, authorizeRoles } from "../middleware/auth.js";

const router = express.Router();

router.use(verifyToken);

// Save (create/update) evaluation - Only TEACHER (and ADMIN)
router.post("/", authorizeRoles("TEACHER", "ADMIN"), evaluationController.saveEvaluation);

// Get evaluations for a workshop - Only TEACHER (and ADMIN)
// Note: Students might want to see their own, but for now this is for the panel.
router.get("/workshop/:id", authorizeRoles("TEACHER", "ADMIN"), evaluationController.getWorkshopEvaluations);

export default router;
