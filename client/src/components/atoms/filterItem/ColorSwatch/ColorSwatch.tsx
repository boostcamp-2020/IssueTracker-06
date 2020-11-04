import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';

interface Props {
  bgColor: string;
}

const StyledColorSwatch = styled.div<Props>`
  border-radius: 2rem;
  width: 1rem;
  height: 1rem;
  background-color: ${({ bgColor }) => bgColor};
`;

const ColorSwatch: FunctionComponent<Props> = ({ bgColor }) => (
  <StyledColorSwatch bgColor={bgColor} />
);

export default ColorSwatch;
