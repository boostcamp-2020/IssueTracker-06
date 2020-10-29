import { Router } from 'express';
import issueRouter from './issue';
import labelsRouter from './labels';
import commentRouter from './comment';

const router = Router();

router.use('/issue', issueRouter);
router.use('/labels', labelsRouter);
router.use('/comment', commentRouter);

export default router;
