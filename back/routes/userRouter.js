import express from "express";
import * as userController from "../controllers/userController.js";
import { verifyToken, authorizeRoles } from "../middleware/authMiddleware.js";

const router = express.Router();

// Todas las rutas de usuarios requieren token y son solo para ADMIN
router.use(verifyToken);
router.use(authorizeRoles("ADMIN"));

router.get("/", userController.getAllUsers);
router.get("/:id", userController.getUserById);
router.post("/", userController.createUser);
router.put("/:id", userController.updateUser);
router.delete("/:id", userController.deleteUser);

export default router;
