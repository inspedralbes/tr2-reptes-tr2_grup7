import express from "express";
import * as requestController from "../controllers/centreRequestController.js";
import { verifyToken } from "../middleware/auth.js";

const router = express.Router();


router.get("/", verifyToken, requestController.getMyRequests);

export default router;
