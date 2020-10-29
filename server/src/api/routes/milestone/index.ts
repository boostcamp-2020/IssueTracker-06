import { Router } from 'express';
import controllers from './controller';

const router = Router();

router.put('/:id', controllers.updateMilestone);

export default router;
