import { Router } from 'express';
import controllers from './controller';

const router = Router();

router.put('/:id', controllers.updateComment);

export default router;
