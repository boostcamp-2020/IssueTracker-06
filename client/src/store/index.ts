import { createContext, Dispatch } from 'react';
import { Issue } from './type';
import { AddIssueReturn, ADD_ISSUE } from './addIssue';

type Action = AddIssueReturn;

interface IssuesState {
  issues: Issue[];
}

interface IssuesContext extends IssuesState {
  dispatch: Dispatch<Action>;
}

const initialIssues: IssuesState = {
  issues: [],
};

export const reducer = (
  state: IssuesState = initialIssues,
  action: Action,
): IssuesState => {
  switch (action.type) {
    case ADD_ISSUE: {
      const issueId = 1; // axios
      const { issue } = action;
      return {
        issues: [...state.issues, { id: issueId, ...issue }],
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
