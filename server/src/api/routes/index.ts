import { Router } from 'express';
import issueRouter from './issue';
import labelRouter from './label';

const router = Router();

router.use('/issue', issueRouter);
router.use('/label', labelRouter);

export default router;
