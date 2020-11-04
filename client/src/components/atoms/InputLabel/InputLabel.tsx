import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';

const StyledInputLabel = styled.span`
  font-size: 1rem;
  font-weight: 600;
`;

interface Props {
  text: string;
}

const InputLabel: FunctionComponent<Props> = ({ text }) => (
  <StyledInputLabel>{text}</StyledInputLabel>
);

export default InputLabel;
