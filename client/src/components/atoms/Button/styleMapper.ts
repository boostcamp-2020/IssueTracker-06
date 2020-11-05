import theme from '@themes/index';

import { ButtonType } from '.';

export default (type: ButtonType) => {
  switch (type) {
    case 'default':
      return `
      transition: filter 0.4s;

      &:hover:not(:disabled) {
        filter: brightness(0.95);
      }
      `;
    case 'error':
      return `
      transition: background 0.4s;
      color: ${theme.palette.BTN_RED};

      & > span {
        color: currentColor;
      }

      &:hover:not(:disabled) {
        color: ${theme.palette.LIGHT};
        background-color: ${theme.palette.BTN_RED};
      }
      `;
    case 'primary':
      return `
      transition: filter 0.4s;
      color: ${theme.palette.LIGHT};
      background-color: ${theme.palette.BTN_GREEN};

      & > span {
        color: currentColor;
      }

      &:hover:not(:disabled) {
        filter: brightness(0.9);
      }
      `;
    case 'transparent':
      return `
      background-color: rgba(0,0,0,0);
      border: none;
      `;
    default:
      return '';
  }
};
