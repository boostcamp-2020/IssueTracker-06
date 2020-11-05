import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';

interface Props {
  value: string;
}

const StyledBoldText = styled.span`
  font-weight: 700;
  font-size: 0.95rem;
`;

const BoldText: FunctionComponent<Props> = ({ value }) => (
  <StyledBoldText>{value}</StyledBoldText>
);

export default BoldText;
