import React from 'react';
import { ThemeProvider } from 'emotion-theming';
import { Global, css } from '@emotion/core';
import reset from 'emotion-reset';

import theme from '../src/themes';

const GlobalStyle = () => (
  <Global
    styles={css`
      ${reset}
      body.sb-show-main {
        margin: 0 !important;
        padding: 0 !important;
      }
      @import url(//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css);

      body.sb-show-main * {
        font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', 'Sans-serif' !important;
      }
    `}
  />
);

export const decorators = [
  (Story) => (
    <ThemeProvider theme={theme}>
      <Story />
      <GlobalStyle />
    </ThemeProvider>
  ),
];

export const parameters = {
  backgrounds: {
    default: 'white',
    values: [
      {
        name: 'white',
        value: '#ffffff',
      },
      {
        name: 'dark',
        value: '#333333',
      },
    ],
  },
};
