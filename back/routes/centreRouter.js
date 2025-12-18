import express from "express";
import * as centreController from "../controllers/centreController.js";

const router = express.Router();

router.get("/", centreController.getAllCentres);
router.get("/:id", centreController.getCentreById);
router.post("/", centreController.createCentre);
router.put("/:id", centreController.updateCentre);
router.delete("/:id", centreController.deleteCentre);

export default router;
