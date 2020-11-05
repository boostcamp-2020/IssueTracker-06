import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';

interface Props {
  content: string | Element;
  onClick?: () => void;
}

const StyledButton = styled.button`
  font-size: 1rem;
  text-decoration: none;
  border: none;
  background-color: rgba(0, 0, 0, 0);
  cursor: pointer;

  &:focus {
    outline: none;
  }
`;

const SelectMenuItem: FunctionComponent<Props> = ({ content, onClick }) => {
  return <StyledButton onClick={onClick}>{content}</StyledButton>;
};

export default SelectMenuItem;
