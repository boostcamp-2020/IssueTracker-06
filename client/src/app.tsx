import React, { FunctionComponent, useReducer, useMemo } from 'react';
import { ThemeProvider } from 'emotion-theming';
import { BrowserRouter, Route, Switch } from 'react-router-dom';
import IssueContext, {
  reducer as issueReducer,
  initialIssues,
  Actions as IssueActions,
} from '@/stores/issue';
import LabelContext, {
  reducer as labelReducer,
  initialLabels,
  Actions as LabelActions,
} from '@stores/label';
import MilestoneContext, {
  reducer as milestoneReducer,
  initialMilestones,
  Actions as MilestoneActions,
} from '@stores/milestone';

import theme from '@themes/index';
import GlobalStyle from '@themes/global';

import Main from '@components/pages/Main';
import IssueDetail from '@components/pages/IssueDetail';
import CreateIssue from '@components/pages/CreateIssue';
import useAsync from './hooks/useAsync';

const App: FunctionComponent = () => {
  const [issues, issueDispatch] = useReducer(issueReducer, initialIssues);
  const [labels, labelDispatch] = useReducer(labelReducer, initialLabels);
  const [milestones, milestoneDispatch] = useReducer(
    milestoneReducer,
    initialMilestones,
  );
  const asyncIssueDispatch = useMemo(
    () => useAsync<IssueActions>(issueDispatch),
    [issueDispatch],
  );
  const asyncLabelDispatch = useMemo(
    () => useAsync<LabelActions>(labelDispatch),
    [labelDispatch],
  );
  const asyncMilestoneDispatch = useMemo(
    () => useAsync<MilestoneActions>(milestoneDispatch),
    [milestoneDispatch],
  );
  return (
    <ThemeProvider theme={theme}>
      <IssueContext.Provider
        value={{
          ...issues,
          dispatch: issueDispatch,
          asyncDispatch: asyncIssueDispatch,
        }}
      >
        <LabelContext.Provider
          value={{
            ...labels,
            dispatch: labelDispatch,
            asyncDispatch: asyncLabelDispatch,
          }}
        >
          <MilestoneContext.Provider
            value={{
              ...milestones,
              dispatch: milestoneDispatch,
              asyncDispatch: asyncMilestoneDispatch,
            }}
          >
            <BrowserRouter>
              <Switch>
                <Route exact path="/" component={Main} />
                <Route exact path="/issue/new" component={CreateIssue} />
                <Route path="/issue/:id" component={IssueDetail} />
              </Switch>
              <GlobalStyle />
            </BrowserRouter>
          </MilestoneContext.Provider>
        </LabelContext.Provider>
      </IssueContext.Provider>
    </ThemeProvider>
  );
};

export default App;
