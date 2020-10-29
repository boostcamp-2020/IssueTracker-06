import { Router } from 'express';
import controllers from './controller';

const router = Router();

router.post('/', controllers.createLabel);

export default router;
