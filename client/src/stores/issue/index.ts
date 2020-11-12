import { createContext, Dispatch } from 'react';
import { Issue } from '../type';
import { AddIssueActions, AddIssueAction, ADD_ISSUE_SUCCESS } from './addIssue';
import {
  GetIssuesActions,
  GetIssuesAction,
  GET_ISSUES_SUCCESS,
} from './getIssues';

export type Actions = AddIssueActions | GetIssuesActions;
export type ActionCreator = AddIssueAction | GetIssuesAction;

interface IssuesState {
  issues: Issue[];
}

interface IssuesContext extends IssuesState {
  dispatch: Dispatch<Actions>;
  asyncDispatch?: (
    action: ActionCreator,
    apiCallback: (requestActions: Actions) => Promise<any>,
  ) => Promise<void>;
}

export const initialIssues: IssuesState = {
  issues: [],
};

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
    case GET_ISSUES_SUCCESS:
      return { issues: action.issues };
    default:
      return state;
  }
};

export default createContext<IssuesContext>({
  ...initialIssues,
  dispatch: () => {},
});
