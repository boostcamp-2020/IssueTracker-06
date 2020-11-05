import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';

const StyledTextarea = styled.textarea`
  ${({ theme }) => theme.commonStyle.input}
`;

interface Props {
  placeHolder?: string;
}

const Textarea: FunctionComponent<Props> = ({ placeHolder }) => (
  <StyledTextarea placeholder={placeHolder} />
);

export default Textarea;
