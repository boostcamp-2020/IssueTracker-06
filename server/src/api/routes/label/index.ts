import { Router } from 'express';
import controllers from './controller';

const router = Router();

router.delete('/', controllers.deleteLabel);

router.put('/', controllers.updateLabel);

export default router;
