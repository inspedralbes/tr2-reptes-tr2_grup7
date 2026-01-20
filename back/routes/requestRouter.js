import express from "express";
import * as requestController from "../controllers/centreRequestController.js";
import { verifyToken, authorizeRoles } from "../middleware/authMiddleware.js";

const router = express.Router();

router.get(
  "/all",
  verifyToken,
  authorizeRoles("ADMIN"),
  requestController.getAllRequests
);

router.get(
  "/",
  verifyToken,
  authorizeRoles("CENTER"),
  requestController.getMyRequests
);

router.get("/", verifyToken, requestController.getMyRequests);

export default router;
