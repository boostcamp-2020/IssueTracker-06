import { Router } from 'express';
import issueRouter from './issue';
import labelsRouter from './labels';
import labelRouter from './label';
import commentRouter from './comment';

const router = Router();

router.use('/issue', issueRouter);

router.use('/label', labelRouter);

router.use('/labels', labelsRouter);

router.use('/comment', commentRouter);

export default router;
