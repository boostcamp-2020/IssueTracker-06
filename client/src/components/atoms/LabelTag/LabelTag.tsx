import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';
import getTextColorByBGColor from '@lib/getTextColorByBGColor';

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
`;

interface Props {
  text: string;
  bgColor: string;
}

const LabelTag: FunctionComponent<Props> = ({ text, bgColor }) => (
  <StyledLabelTag style={{ backgroundColor: bgColor }} bgColor={bgColor}>
    {text}
  </StyledLabelTag>
);

export default LabelTag;
