import { AddIssueAction, AddIssueActions } from './issue/addIssue';
import { ReadLabelsAction, ReadLabelsActions } from './label/readLabels';

export type Actions = AddIssueActions | ReadLabelsActions;
export type ActionCreator = AddIssueAction | ReadLabelsAction;
