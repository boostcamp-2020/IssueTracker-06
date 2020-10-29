import { Router } from 'express';
import issueRouter from './issue';
import labelRouter from './label';
import commentRouter from './comment';

const router = Router();

router.use('/issue', issueRouter);

router.use('/label', labelRouter);

router.use('/comment', commentRouter);

export default router;
