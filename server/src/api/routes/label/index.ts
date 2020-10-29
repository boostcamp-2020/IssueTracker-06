import { Router } from 'express';
import controllers from './controller';

const router = Router();

router.delete('/', controllers.deleteLabel);

export default router;
