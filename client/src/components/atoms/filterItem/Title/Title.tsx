import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';

const StyledTitle = styled.strong`
  font-size: 0.8rem;
`;

interface Props {
  text: string;
}

const Title: FunctionComponent<Props> = ({ text }) => (
  <StyledTitle>{text}</StyledTitle>
);

export default Title;
