import express from "express";
import * as adminController from "../controllers/adminController.js";
import { verifyToken } from "../middleware/auth.js";
import { isAdmin } from "../middleware/authMiddleware.js";

const router = express.Router();

// Estadísticas del panel de admin
router.get("/stats", verifyToken, isAdmin, adminController.getAdminStats);

// Todas las peticiones para gestión
router.get("/requests", verifyToken, isAdmin, adminController.getAllRequests);

// Detalles de una petición específica con estudiantes
router.get("/requests/:id", verifyToken, isAdmin, adminController.getRequestById);

// Peticiones pendientes para asignación
router.get("/pending-requests", verifyToken, isAdmin, adminController.getPendingRequests);

// Profesores disponibles
router.get("/teachers", verifyToken, isAdmin, adminController.getAvailableTeachers);

// Talleres más solicitados
router.get("/top-workshops", verifyToken, isAdmin, adminController.getTopWorkshops);

// Centros disponibles
router.get("/centers", verifyToken, isAdmin, adminController.getAllCenters);


// Teacher management routes
router.get("/teachers/:id", verifyToken, isAdmin, adminController.getTeacherById);
router.put("/teachers/:id", verifyToken, isAdmin, adminController.updateTeacher);
router.put("/teachers/:id/assign-center", verifyToken, isAdmin, adminController.assignCenterToTeacher);
router.put("/teachers/:id/toggle-active", verifyToken, isAdmin, adminController.toggleTeacherActive);


// Operaciones CRUD de peticiones
router.put("/requests/:id", verifyToken, isAdmin, adminController.updateRequest);
router.put("/requests/:id/accept", verifyToken, isAdmin, adminController.acceptRequest);
router.put("/requests/:id/reject", verifyToken, isAdmin, adminController.rejectRequest);
router.delete("/requests/:id", verifyToken, isAdmin, adminController.deleteRequest);

// Asignación manual
router.post("/assign", verifyToken, isAdmin, adminController.manualAssign);

// Asignación automática
router.post("/auto-assign", verifyToken, isAdmin, adminController.autoAssign);

export default router;