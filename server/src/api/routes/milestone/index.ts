import { Router } from 'express';
import controllers from './controller';

const router = Router();

router.post('/', controllers.createMilestone);

router.put('/:id', controllers.updateMilestone);

router.patch('/:id/status', controllers.updateMilestoneStatus);

router.delete('/:id', controllers.deleteMilestone);

export default router;
