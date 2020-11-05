import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';

interface StyledProps {
  bgColor: string;
}

const StyledLabelTag = styled.span<StyledProps>`
  display: inline-block;
  vertical-align: middle;
  padding: 0.05rem 0.8rem;
  font-size: 0.7rem;
  font-weight: 500;
  border-radius: 0.7rem;
  line-height: 20px;
  color: ${({ bgColor }) =>
    parseInt(bgColor.replace('#', ''), 16) > 0xffffff / 2 ? '#000' : '#fff'};
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
