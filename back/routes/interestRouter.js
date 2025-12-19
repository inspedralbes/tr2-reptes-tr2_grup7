import express from "express";
import * as interestController from "../controllers/interestController.js";
import { verifyToken } from "../middleware/auth.js";

const router = express.Router();

router.post("/", verifyToken, interestController.createInterest);
router.get("/center", verifyToken, interestController.getInterestsByCenter);

export default router;
