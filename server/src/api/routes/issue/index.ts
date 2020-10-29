import { Router } from 'express';
import controllers from './controller';

const router = Router();

router.post('/', controllers.createIssue);

router.get('/:id', controllers.getIssue);

router.patch('/:id/status', controllers.updateIssueStatus);

export default router;
