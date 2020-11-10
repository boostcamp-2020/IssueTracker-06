import React, { FunctionComponent, useReducer, useMemo } from 'react';
import { ThemeProvider } from 'emotion-theming';
import { BrowserRouter, Route, Switch } from 'react-router-dom';
import IssueContext, { reducer, initialIssues } from '@stores/.';

import theme from '@themes/index';
import GlobalStyle from '@themes/global';

import Main from '@components/pages/Main';
import useAsync from './hooks/useAsync';

const App: FunctionComponent = () => {
  const [issues, dispatch] = useReducer(reducer, initialIssues);
  const asyncDispatch = useMemo(() => useAsync(dispatch), [dispatch]);
  return (
    <ThemeProvider theme={theme}>
      <IssueContext.Provider value={{ ...issues, dispatch, asyncDispatch }}>
        <BrowserRouter>
          <Switch>
            <Route exact path="/" component={Main} />
          </Switch>
          <GlobalStyle />
        </BrowserRouter>
      </IssueContext.Provider>
    </ThemeProvider>
  );
};

export default App;
