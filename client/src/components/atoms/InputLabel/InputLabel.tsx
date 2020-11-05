import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';

const StyledInputLabel = styled.span`
  display: block;
  font-size: 0.9rem;
  font-weight: 600;
  margin-bottom: 0.7rem;
`;

interface Props {
  text: string;
}

const InputLabel: FunctionComponent<Props> = ({ text }) => (
  <StyledInputLabel>{text}</StyledInputLabel>
);

export default InputLabel;
