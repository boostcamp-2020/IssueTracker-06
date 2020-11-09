const theme = {
  palette: {
    PRIMARY: '#24292e',
    LIGHT: '#ffffff',
    SECONDARY: '#586069',
    BTN_GREEN: '#2ea44f',
    BTN_RED: '#d73a49',
    OPEN_GREEN: '#28a745',
    CLOSE_RED: '#d73a49',
    LINK_BLUE: '#0366d6',
    BG_COLOR01: '#fafbfc',
    BG_COLOR02: '#f6f8fa',
    BG_COLOR03: 'rgba(209,213,218,0.5)',
    BG_COLOR04: '#e1e4e8',
    BORDER_COLOR: 'rgba(27,31,35,0.15)',
    LIGHT_BLUE01: '#f1f8ff',
    LIGHT_BLUE02: 'rgba(3,102,214,0.2)',
    BLUE_SHADOW: 'rgba(3, 102, 214, 0.3)',
  },
  commonStyle: {
    input: `
    background-color: #fafbfc;
    border-radius: .5rem;
    border: 1px solid #e1e4e8;
    color: #24292e;
    &:focus{
      background-color: #ffffff;
      border: 1px solid #0366d6;
      box-shadow: 0 0 0 3px rgba(3, 102, 214, 0.3);
      outline: none;
    }
    `,
  },
};

export default theme;
