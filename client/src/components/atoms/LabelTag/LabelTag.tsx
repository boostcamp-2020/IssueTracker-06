import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';
import getTextColorByBGColor from '@lib/getTextColorByBGColor';
import { Label } from '.';

interface StyledProps {
  bgColor: string;
}

const StyledLabelTag = styled.span<StyledProps>`
  display: inline-block;
  vertical-align: middle;
  padding: 0.03rem 0.7rem;
  font-size: 0.7rem;
  font-weight: 500;
  border-radius: 0.7rem;
  line-height: 20px;
  color: ${({ bgColor }) => getTextColorByBGColor(bgColor)};
  background-color: ${({ bgColor }) => bgColor};
`;

const LabelTag: FunctionComponent<Label> = ({ name, color }) => (
  <StyledLabelTag bgColor={color}>{name}</StyledLabelTag>
);

export default LabelTag;
