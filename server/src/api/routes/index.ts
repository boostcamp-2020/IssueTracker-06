import { Router } from 'express';
import issueRouter from './issue';
import labelsRouter from './labels';
import labelRouter from './label';
import commentRouter from './comment';
import milestoneRouter from './milestone';

const router = Router();

router.use('/issue', issueRouter);

router.use('/label', labelRouter);

router.use('/labels', labelsRouter);

router.use('/comment', commentRouter);

router.use('/milestone', milestoneRouter);

export default router;
