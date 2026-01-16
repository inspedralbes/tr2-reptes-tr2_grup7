import express from "express";
import * as requestController from "../controllers/centreRequestController.js";
import { verifyToken, authorizeRoles } from "../middleware/auth.js";

const router = express.Router();

router.get(
  "/all",
  verifyToken,
  authorizeRoles("ADMIN"),
  requestController.getAllRequests
);
router.post(
  "/",
  verifyToken,
  authorizeRoles("CENTER"),
  requestController.createRequest
);
router.get(
  "/",
  verifyToken,
  authorizeRoles("CENTER"),
  requestController.getMyRequests
);

router.get("/", verifyToken, requestController.getMyRequests);

export default router;
