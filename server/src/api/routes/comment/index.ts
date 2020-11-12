import { Router } from 'express';
import controllers from './controller';

const router = Router();

router.post('/', controllers.createComment);
router.put('/:id', controllers.updateComment);

export default router;
