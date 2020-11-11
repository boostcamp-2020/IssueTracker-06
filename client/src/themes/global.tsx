import React from 'react';
import { Global, css } from '@emotion/core';
import reset from 'emotion-reset';

const GlobalStyle = () => (
  <Global
    styles={css`
      ${reset}

      @import url(//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css);

      html {
        font-size: 16px;
      }

      body {
        font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', 'Sans-serif';
      }

      a {
        text-decoration: none;
        color: currentColor;
      }
    `}
  />
);

export default GlobalStyle;
