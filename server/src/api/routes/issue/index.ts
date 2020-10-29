import { Router } from 'express';
import controllers from './controller';

const router = Router();

router.post('/', controllers.createIssue);

router.get('/:id', controllers.getIssue);

export default router;
