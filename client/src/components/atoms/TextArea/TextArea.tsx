import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';

interface StyledProps {
  textAreaHeight: string;
  textAreaWidth: string;
}

const StyledTextarea = styled.textarea<StyledProps>`
  ${({ theme }) => theme.commonStyle.input};
  resize: vertical;
  height: ${({ textAreaHeight }) => textAreaHeight};
  width: ${({ textAreaWidth }) => textAreaWidth};

  &:focus {
    outline: none;
  }
`;

interface Props {
  placeHolder?: string;
  textAreaHeight: string;
  textAreaWidth: string;
}

const Textarea: FunctionComponent<Props> = ({
  placeHolder,
  textAreaHeight,
  textAreaWidth,
}) => (
  <StyledTextarea
    placeholder={placeHolder}
    textAreaHeight={textAreaHeight}
    textAreaWidth={textAreaWidth}
  />
);

export default Textarea;
