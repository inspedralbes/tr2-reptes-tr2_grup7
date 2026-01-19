import express from "express";
import * as centreController from "../controllers/centreController.js";

const router = express.Router();

router.get("/", centreController.getAllCentres);
router.get("/:id", centreController.getCentreById);
router.get("/:id/teachers", centreController.getCentreTeachers);
router.get("/:id/students", centreController.getCentreStudents);
router.get("/:id/stats", centreController.getCentreStats);
router.get("/:id/requests", centreController.getCentreRequests);
router.post("/", centreController.createCentre);
router.put("/:id", centreController.updateCentre);
router.delete("/:id", centreController.deleteCentre);

// Student CRUD routes
router.put("/:id/students/:studentId", centreController.updateStudent);
router.delete("/:id/students/:studentId", centreController.deleteStudent);

// Teacher CRUD routes
router.post("/:id/teachers", centreController.createTeacher);
router.put("/:id/teachers/:teacherId", centreController.updateTeacher);
router.delete("/:id/teachers/:teacherId", centreController.deleteTeacher);

export default router;
