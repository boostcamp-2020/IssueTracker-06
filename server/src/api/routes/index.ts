import { Router } from 'express';
import issueRouter from './issue';
import labelsRouter from './labels';

const router = Router();

router.use('/issue', issueRouter);
router.use('/labels', labelsRouter);

export default router;
