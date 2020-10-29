import { Router } from 'express';
import controllers from './controller';

const router = Router();

router.post('/', controllers.createLabel);

router.put('/:id', controllers.updateLabel);

router.delete('/:id', controllers.deleteLabel);

export default router;
