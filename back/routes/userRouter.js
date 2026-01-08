import express from "express";
import * as userController from "../controllers/userController.js";

//Aquí es posa tota les rutes que tinguem per a la gestió dels usuaris

const router = express.Router();

router.get("/", verifyToken, userController.getAllUsers);
router.get("/:id", verifyToken, userController.getUserById);
router.post("/", userController.createUser);
router.put("/:id", verifyToken, userController.updateUser);
router.delete("/:id", verifyToken, userController.deleteUser);

export default router;
