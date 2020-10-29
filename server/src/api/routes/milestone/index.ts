import { Router } from 'express';
import controllers from './controller';

const router = Router();

router.post('/', controllers.createMilestone);

export default router;
