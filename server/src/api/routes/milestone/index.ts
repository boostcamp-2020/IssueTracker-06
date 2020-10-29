import { Router } from 'express';
import controllers from './controller';

const router = Router();

router.put('/:id', controllers.updateMilestone);

router.put('/:id/status', controllers.updateMilestoneStatus);

export default router;
