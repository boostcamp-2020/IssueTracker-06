import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';

interface Props {
  Icon: FunctionComponent;
  content: string;
  onClick: () => void;
}

const StyledButton = styled.button`
  display: flex;
  align-items: center;
  font-size: 1rem;
  font-weight: 600;
  text-align: center;
  color: ${({ theme }) => theme.palette.SECONDARY};
  text-decoration: none;
  border: none;
  background-color: rgba(0, 0, 0, 0);
  cursor: pointer;

  & > svg {
    width: 1rem;
    height: 1rem;
    padding: 1px;
    margin-right: 3px;
    fill: ${({ theme }) => theme.palette.LIGHT};
    background-color: currentColor;
    border-radius: 0.3rem;
    border: none;
  }

  &:hover {
    color: ${({ theme }) => theme.palette.LINK_BLUE};
  }

  &:hover svg {
    background-color: ${({ theme }) => theme.palette.LINK_BLUE};
  }

  &:focus {
    outline: none;
  }
`;

const XButton: FunctionComponent<Props> = ({ Icon, content, onClick }) => {
  return (
    <StyledButton onClick={onClick}>
      <Icon />
      {content}
    </StyledButton>
  );
};

export default XButton;
