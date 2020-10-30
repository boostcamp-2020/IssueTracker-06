import { Router } from 'express';
import controllers from './controller';

const router = Router();

router.post('/', controllers.createIssue);

router.get('/:id', controllers.getIssue);

router.patch('/:id/title', controllers.updateIssueTitle);

router.patch('/:id/content', controllers.updateIssueContent);

router.patch('/:id/status', controllers.updateIssueStatus);

router.patch('/:id/:target', controllers.updateIssue);

export default router;
