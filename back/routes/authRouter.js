import express from "express";
import * as authController from "../controllers/authController.js";

const router = express.Router();

// Need middleware to verify token because this is an authenticated action
import { verifyToken } from "../middleware/authMiddleware.js";

router.post("/login", authController.login);
router.post("/change-password", verifyToken, authController.changePassword);

export default router;
