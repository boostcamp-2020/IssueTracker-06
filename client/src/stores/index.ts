import { AddIssueActions, AddIssueAction } from './issue/addIssue';
import { GetIssuesActions, GetIssuesAction } from './issue/getIssues';
import { ReadLabelsAction, ReadLabelsActions } from './label/readLabels';

export type Actions = AddIssueActions | ReadLabelsActions | GetIssuesActions;
export type ActionCreator = AddIssueAction | ReadLabelsAction | GetIssuesAction;
