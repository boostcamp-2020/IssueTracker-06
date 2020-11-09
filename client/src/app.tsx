import React, { FunctionComponent } from 'react';
import { ThemeProvider } from 'emotion-theming';
import { BrowserRouter, Route, Switch } from 'react-router-dom';

import theme from '@themes/index';
import GlobalStyle from '@themes/global';

import Main from '@components/pages/Main';

const App: FunctionComponent = () => (
  <ThemeProvider theme={theme}>
    <BrowserRouter>
      <Switch>
        <Route exact path="/" component={Main} />
      </Switch>
      <GlobalStyle />
    </BrowserRouter>
  </ThemeProvider>
);

export default App;
