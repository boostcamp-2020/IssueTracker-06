import { Router } from 'express';
import controllers from './controller';

const router = Router();

router.get('/', controllers.getLabels);

export default router;
