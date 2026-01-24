import express from "express";
import * as adminController from "../controllers/adminController.js";
import { verifyToken, verifyAdmin } from "../middleware/authMiddleware.js";

const router = express.Router();

// Estadísticas del panel de admin
router.get("/stats", verifyToken, verifyAdmin, adminController.getAdminStats);

// Todas las peticiones para gestión
router.get(
  "/requests",
  verifyToken,
  verifyAdmin,
  adminController.getAllRequests,
);

// Detalles de una petición específica con estudiantes
router.get(
  "/requests/:id",
  verifyToken,
  verifyAdmin,
  adminController.getRequestById,
);

// Peticiones pendientes para asignación
router.get(
  "/pending-requests",
  verifyToken,
  verifyAdmin,
  adminController.getPendingRequests,
);

// Profesores disponibles
router.get(
  "/teachers",
  verifyToken,
  verifyAdmin,
  adminController.getAvailableTeachers,
);

// Talleres más solicitados
router.get(
  "/top-workshops",
  verifyToken,
  verifyAdmin,
  adminController.getTopWorkshops,
);

// Centros disponibles
router.get("/centers", verifyToken, verifyAdmin, adminController.getAllCenters);

// Teacher management routes

router.get(
  "/teachers/:id",
  verifyToken,
  verifyAdmin,
  adminController.getTeacherById,
);
router.put(
  "/teachers/:id",
  verifyToken,
  verifyAdmin,
  adminController.updateTeacher,
);
router.put(
  "/teachers/:id/assign-center",
  verifyToken,
  verifyAdmin,
  adminController.assignCenterToTeacher,
);
router.put(
  "/teachers/:id/toggle-active",
  verifyToken,
  verifyAdmin,
  adminController.toggleTeacherActive,
);

// Operaciones CRUD de peticiones
router.put(
  "/requests/:id",
  verifyToken,
  verifyAdmin,
  adminController.updateRequest,
);
router.put(
  "/requests/:id/accept",
  verifyToken,
  verifyAdmin,
  adminController.acceptRequest,
);
router.put(
  "/requests/:id/reject",
  verifyToken,
  verifyAdmin,
  adminController.rejectRequest,
);
router.delete(
  "/requests/:id",
  verifyToken,
  verifyAdmin,
  adminController.deleteRequest,
);
router.put(
  "/requests/:id/students",
  verifyToken,
  verifyAdmin,
  adminController.manageRequestStudents,
);

// User management routes
router.get("/users", verifyToken, verifyAdmin, adminController.getAllUsers);
router.put("/users/:id", verifyToken, verifyAdmin, adminController.updateUser);
router.delete(
  "/users/:id",
  verifyToken,
  verifyAdmin,
  adminController.deleteUser,
);
router.post("/users", verifyToken, verifyAdmin, adminController.createUser);

// Asignación manual
router.post("/assign", verifyToken, verifyAdmin, adminController.manualAssign);

// Asignación automática
router.post(
  "/auto-assign",
  verifyToken,
  verifyAdmin,
  adminController.autoAssign,
);

export default router;
