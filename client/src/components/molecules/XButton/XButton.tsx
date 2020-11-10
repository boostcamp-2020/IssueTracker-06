import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';
import { ResetIcon } from '@components/atoms/icons';
import TextWithIcon from '@components/molecules/TextWithIcon';

interface Props {
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
    width: 1rem;
    height: 1rem;
    padding: 1px;
    margin-right: 3px;
    fill: ${({ theme }) => theme.palette.LIGHT};
    background-color: currentColor;
    border-radius: 0.3rem;
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

const XButton: FunctionComponent<Props> = ({ content, onClick }) => {
  return (
    <StyledButton onClick={onClick}>
      <TextWithIcon icon={ResetIcon} text={content} />
    </StyledButton>
  );
};

export default XButton;
