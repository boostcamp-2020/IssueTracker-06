import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';

interface Props {
  children: React.ReactChild;
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

const SelectMenuItem: FunctionComponent<Props> = ({ children, onClick }) => {
  return (
    <li>
      <StyledButton onClick={onClick}>{children}</StyledButton>
    </li>
  );
};

export default SelectMenuItem;
