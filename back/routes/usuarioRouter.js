import express from "express";
import * as usuarioController from "../controllers/usuarioController.js";

//Aquí es posa tota les rutes que tinguem per a la gestió dels usuaris

const router = express.Router();

router.get("/", usuarioController.getAllUsuarios);
router.get("/:id", usuarioController.getUsuarioById);
router.post("/", usuarioController.createUsuario);
router.put("/:id", usuarioController.updateUsuario);
router.delete("/:id", usuarioController.deleteUsuario);

export default router;
