import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';

const StyledDescription = styled.div`
  font-size: 0.4rem;
  overflow: hidden;
  text-overflow: ellipsis;
  color: ${({ theme }) => theme.palette.SECONDARY};
`;

interface Props {
  text: string;
}

const Description: FunctionComponent<Props> = ({ text }) => (
  <StyledDescription>{text}</StyledDescription>
);

export default Description;
