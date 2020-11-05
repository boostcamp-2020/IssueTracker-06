const theme = {
  palette: {
    PRIMARY: '#24292e',
    LIGHT: '#ffffff',
    SENCONDARY: '#586069',
    BTN_GREEN: '#2ea44f',
    BTN_RED: '#d73a49',
    OPEN_GREEN: '#28a745',
    CLOSE_RED: '#d73a49',
    LINK_BLUE: '#0366d6',
    BG_COLOR01: '#fafbfc',
    BG_COLOR02: '#f6f8fa',
    BG_COLOR03: 'rgba(209,213,218,0.5)',
    LIGHT_BLUE01: '#f1f8ff',
    LIGHT_BLUE02: 'rgba(3,102,214,0.2)',
  },
  commonStyle: {
    input: `
    background-color: #fafbfc;
    border-radius: .5rem;
    border: 1px solid #f6f8fa;
    &:focus{
      background-color: #ffffff;
      border-color: #0366d6;
      box-shawdow: 0 0 0 3px rgba(3, 102, 214, 0.3);
    }
    `,
  },
};

export default theme;
