import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';

interface Props {
  Icon: FunctionComponent;
  value: string;
  onClick: (e: React.MouseEvent<HTMLButtonElement>) => void;
}

const StyledButton = styled.button`
  font-size: 1rem;
  font-weight: 600;
  text-align: center;
  color: ${({ theme }) => theme.palette.SECONDARY};
  text-decoration: none;
  border: none;
  opacity: 1;

  cursor: pointer;
  & > svg {
    width: 18px;
    height: 18px;
    padding: 1px;
    margin-right: 3px;
    fill: ${({ theme }) => theme.palette.LIGHT};
    background-color: ${({ theme }) => theme.palette.SECONDARY};
    border-radius: 6px;
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

const XButton: FunctionComponent<Props> = ({ Icon, value, onClick }) => {
  return (
    <StyledButton onClick={onClick}>
      <Icon />
      {value}
    </StyledButton>
  );
};

export default XButton;
