import { Issue } from '@stores/type';

export const GET_ISSUES_REQUEST = 'GET_ISSUES_REQUEST';
export const GET_ISSUES_SUCCESS = 'GET_ISSUES_SUCESS';
export const GET_ISSUES_FAILURE = 'GET_ISSUES_FAILURE';

export interface GetIssuesRequest {
  type: typeof GET_ISSUES_REQUEST;
}

export interface GetIssuesSuccess {
  type: typeof GET_ISSUES_SUCCESS;
  issues: Issue[];
}

export interface GetIssuesFailure {
  type: typeof GET_ISSUES_FAILURE;
  error: string;
}

export interface GetIssuesAction {
  request: () => GetIssuesRequest;
  success: (issues: Issue[]) => GetIssuesSuccess;
  failure: (error: string) => GetIssuesFailure;
}

export type GetIssuesActions =
  | GetIssuesRequest
  | GetIssuesSuccess
  | GetIssuesFailure;

const getIssuesAction = (): GetIssuesAction => ({
  request: (): GetIssuesRequest => ({ type: GET_ISSUES_REQUEST }),
  success: (issues: Issue[]): GetIssuesSuccess => ({
    type: GET_ISSUES_SUCCESS,
    issues,
  }),
  failure: (error: string): GetIssuesFailure => ({
    type: GET_ISSUES_FAILURE,
    error,
  }),
});

export default getIssuesAction;
