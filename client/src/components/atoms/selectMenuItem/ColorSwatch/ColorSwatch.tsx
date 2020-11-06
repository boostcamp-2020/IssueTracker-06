import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';

interface Props {
  bgColor: string;
}

const StyledColorSwatch = styled.span<Props>`
  display: inline-block;
  border-radius: 2rem;
  width: 1rem;
  height: 1rem;
  background-color: ${({ bgColor }) => bgColor};
  margin-right: 0.2rem;
`;

const ColorSwatch: FunctionComponent<Props> = ({ bgColor }) => (
  <StyledColorSwatch bgColor={bgColor} />
);

export default ColorSwatch;
