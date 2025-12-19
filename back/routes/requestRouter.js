import express from "express";
import * as requestController from "../controllers/centerRequestController.js";
import { verifyToken } from "../middleware/auth.js";

const router = express.Router();

router.post("/", verifyToken, requestController.createRequest);
router.get("/", verifyToken, requestController.getMyRequests);

export default router;
