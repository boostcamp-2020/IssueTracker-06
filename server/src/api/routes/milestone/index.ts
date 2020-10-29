import { Router } from 'express';
import controllers from './controller';

const router = Router();

router.post('/', controllers.createMilestone);

router.delete('/:id', controllers.deleteMilestone);

export default router;
