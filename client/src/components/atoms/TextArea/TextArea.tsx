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
`;

interface Props {
  placeHolder?: string;
  textAreaHeight: string;
  textAreaWidth: string;
  onChange: (e: React.ChangeEvent<HTMLTextAreaElement>) => void;
  value: string;
}

const Textarea: FunctionComponent<Props> = ({
  placeHolder,
  textAreaHeight,
  textAreaWidth,
  onChange,
  value,
}) => (
  <StyledTextarea
    placeholder={placeHolder}
    textAreaHeight={textAreaHeight}
    textAreaWidth={textAreaWidth}
    onChange={onChange}
    value={value}
  />
);

export default Textarea;
