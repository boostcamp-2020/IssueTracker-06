import styled, { CreateStyled } from '@emotion/styled';
import theme from './index';

type Theme = typeof theme;

export default styled as CreateStyled<Theme>;
