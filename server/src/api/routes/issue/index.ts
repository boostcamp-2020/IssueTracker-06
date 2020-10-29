import { Router } from 'express';
import controllers from './controller';

const router = Router();

router.post('/', controllers.createIssue);

router.patch('/:id/title', controllers.updateIssueTitle);

export default router;
