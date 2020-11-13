import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';

interface Props {
  value: string;
}

const StyledPlainText = styled.span`
  font-size: 0.95rem;
  color: ${({ theme }) => theme.palette.SECONDARY};
`;

const PlainText: FunctionComponent<Props> = ({ value }) => (
  <StyledPlainText>{value}</StyledPlainText>
);

export default PlainText;
