import { AddIssueActions, AddIssueAction, ADD_ISSUE_SUCCESS } from './addIssue';
import { GetIssuesActions, GetIssuesAction, GET_ISSUES_REQUEST, GET_ISSUES_SUCCESS, GET_ISSUES_FAILURE } from './getIssues';
import { ReadLabelsAction, ReadLabelsActions } from './label/readLabels';

export type Actions = AddIssueActions | ReadLabelsActions | GetIssuesActions;
export type ActionCreator = AddIssueAction | ReadLabelsAction | GetIssuesAction;

// TODO: issueReducer로 이동
export const reducer = (
  state: IssuesState = initialIssues,
  action: Actions,
): IssuesState => {
  switch (action.type) {
    case ADD_ISSUE_SUCCESS: {
      const { createdIssue } = action;
      return {
        issues: [...state.issues, createdIssue],
      };
    }
    case GET_ISSUES_REQUEST:
    case GET_ISSUES_FAILURE:
      return { ...state };
    case GET_ISSUES_SUCCESS:
      return { issues: action.issues };
    default:
      return state;
  }
};
