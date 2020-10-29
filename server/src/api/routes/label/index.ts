import { Router } from 'express';
import controllers from './controller';

const router = Router();

router.delete('/:id', controllers.deleteLabel);

router.put('/:id', controllers.updateLabel);

export default router;
