import { createContext, Dispatch } from 'react';
import { Issue } from '../type';
import { AddIssueActions, AddIssueAction, ADD_ISSUE_SUCCESS } from './addIssue';

export type Actions = AddIssueActions;
export type ActionCreator = AddIssueAction;

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
    default:
      return state;
  }
};

export default createContext<IssuesContext>({
  ...initialIssues,
  dispatch: () => {},
});
