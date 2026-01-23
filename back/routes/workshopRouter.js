import express from "express";
import * as workshopController from "../controllers/workshopController.js";
import * as attendanceController from "../controllers/attendanceController.js";
import * as sessionController from "../controllers/sessionController.js";
import { verifyToken, authorizeRoles } from "../middleware/authMiddleware.js";

const router = express.Router();

// Rutas protegidas por token
router.use(verifyToken);

// Solo el profesor (TEACHER) y el ADMIN pueden ver "sus" talleres
router.get("/mine", authorizeRoles("TEACHER", "ADMIN"), workshopController.getMyWorkshops);
router.get("/sessions/upcoming", authorizeRoles("TEACHER", "ADMIN"), sessionController.getUpcomingSessions);

// Asistencia (TEACHER, ADMIN)
router.get("/:id_workshop/students", authorizeRoles("TEACHER", "ADMIN"), attendanceController.getStudentsForAttendance);
router.post("/attendance", authorizeRoles("TEACHER", "ADMIN"), attendanceController.saveAttendance);
router.get("/:id_workshop/sessions", authorizeRoles("TEACHER", "ADMIN"), sessionController.getSessionsByWorkshop);


// Todos los usuarios autenticados pueden ver el catálogo y detalles
router.get("/", workshopController.getAllWorkshops);
router.get("/:id", workshopController.getWorkshopById);

// Solo ADMIN puede gestionar talleres (crear, editar, borrar)
router.post("/", authorizeRoles("ADMIN"), workshopController.createWorkshop);
router.put("/:id", authorizeRoles("ADMIN"), workshopController.updateWorkshop);
router.delete("/:id", authorizeRoles("ADMIN"), workshopController.deleteWorkshop);

export default router;
