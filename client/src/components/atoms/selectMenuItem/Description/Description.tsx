import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';

const StyledDescription = styled.div`
  font-size: 0.7rem;
  text-overflow: ellipsis;
  color: ${({ theme }) => theme.palette.SECONDARY};
`;

interface Props {
  text?: string;
}

const Description: FunctionComponent<Props> = ({ text }) => (
  <StyledDescription>{text}</StyledDescription>
);

export default Description;
