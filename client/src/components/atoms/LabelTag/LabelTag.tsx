import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';

const StyledLabelTag = styled.span`
  display: inline-block;
  padding: 0 7px;
  font-size: 12px;
  font-weight: 500;
  border-radius: 1rem;
  color: #000;
  line-height: 18px;
`;

interface Props {
  text: string;
  bgColor: string;
}

const LabelTag: FunctionComponent<Props> = ({ text, bgColor }) => (
  <StyledLabelTag style={{ backgroundColor: bgColor }}>{text}</StyledLabelTag>
);

export default LabelTag;
