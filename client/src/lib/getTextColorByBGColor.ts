import theme from '@themes/index';

const { PRIMARY, LIGHT } = theme.palette;

const HEX_NUMBER = 16;

const AVERAGE_LUMA = 127.5;

const RED_BASE = 0.2126;
const GREEN_BASE = 0.7152;
const BLUE_BASE = 0.0722;

type ResponseType = typeof PRIMARY | typeof LIGHT;

const getTextColorByBGColor = (hexColor: string): ResponseType => {
  const pureColor = hexColor.substring(1);
  const red = parseInt(pureColor.substring(0, 2), HEX_NUMBER);
  const green = parseInt(pureColor.substring(2, 4), HEX_NUMBER);
  const blue = parseInt(pureColor.substring(4, 6), HEX_NUMBER);

  const luma = RED_BASE * red + GREEN_BASE * green + BLUE_BASE * blue;

  return luma < AVERAGE_LUMA ? LIGHT : PRIMARY;
};

export default getTextColorByBGColor;
