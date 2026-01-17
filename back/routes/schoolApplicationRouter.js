import express from 'express';
import { verifyToken } from '../middleware/auth.js';
import * as applicationController from '../controllers/schoolApplicationController.js';

const router = express.Router();

// Protected routes (Center only for creation, but we check role inside or via middleware if needed)
// Assuming verifyToken populates req.user
router.post('/', verifyToken, applicationController.createApplication);
router.get('/', verifyToken, applicationController.getMyApplications);
router.get('/:id', verifyToken, applicationController.getApplicationById);

export default router;
