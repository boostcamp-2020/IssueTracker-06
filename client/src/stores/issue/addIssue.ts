import { Issue } from '@stores/type';
import { CreateIssue } from '@apis/createIssue';

export const ADD_ISSUE_REQUEST = 'ADD_ISSUE_REQUEST';
export const ADD_ISSUE_SUCCESS = 'ADD_ISSUE_SUCESS';
export const ADD_ISSUE_FAILURE = 'ADD_ISSUE_FAILURE';

export interface AddIssueRequest {
  type: typeof ADD_ISSUE_REQUEST;
  issue: CreateIssue;
}

export interface AddIssueSuccess {
  type: typeof ADD_ISSUE_SUCCESS;
  createdIssue: Issue;
}

export interface AddIssueFailure {
  type: typeof ADD_ISSUE_FAILURE;
  error: string;
}

export interface AddIssueAction {
  request: () => AddIssueRequest;
  success: (createdIssue: Issue) => AddIssueSuccess;
  failure: (error: string) => AddIssueFailure;
}

export type AddIssueActions =
  | AddIssueRequest
  | AddIssueSuccess
  | AddIssueFailure;

const addIssueAction = (issue: CreateIssue): AddIssueAction => ({
  request: (): AddIssueRequest => ({ type: ADD_ISSUE_REQUEST, issue }),
  success: (createdIssue: Issue): AddIssueSuccess => ({
    type: ADD_ISSUE_SUCCESS,
    createdIssue,
  }),
  failure: (error: string): AddIssueFailure => ({
    type: ADD_ISSUE_FAILURE,
    error,
  }),
});

export default addIssueAction;
