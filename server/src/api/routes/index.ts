import { Router } from 'express';
import issueRouter from './issue';

const router = Router();

router.use('/issue', issueRouter);

export default router;
