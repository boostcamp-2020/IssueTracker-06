import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';
import TextWithIcon from '../TextWithIcon';

interface Props {
  Icon: FunctionComponent;
  content: string;
  onClick: () => void;
}

const StyledButton = styled.button`
  display: flex;
  align-items: center;
  text-decoration: none;
  border: none;
  background-color: rgba(0, 0, 0, 0);
  cursor: pointer;

  & span {
    color: ${({ theme }) => theme.palette.SECONDARY};
  }

  & svg {
    display: flex;
    vertical-align: center;
    width: 1rem;
    height: 1rem;
    padding: 1px;
    margin-right: 3px;
    fill: ${({ theme }) => theme.palette.LIGHT};
    background-color: currentColor;
    border-radius: 0.3rem;
    border: none;
  }

  &:hover span {
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
      <TextWithIcon icon={Icon} text={content} />
    </StyledButton>
  );
};

export default XButton;
