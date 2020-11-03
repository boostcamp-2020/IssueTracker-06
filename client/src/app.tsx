import React, { FunctionComponent } from 'react';
import { ThemeProvider } from 'emotion-theming';

import theme from '@themes/index';
import GlobalStyle from '@themes/global';

const App: FunctionComponent = () => (
  <ThemeProvider theme={theme}>
    <GlobalStyle />
    init
  </ThemeProvider>
);

export default App;
