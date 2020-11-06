import { Router } from 'express';
import controllers from './controller';

const router = Router();

router.get('/', controllers.getMilestones);

export default router;
