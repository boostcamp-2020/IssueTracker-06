import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';

import { ButtonType } from '.';
import styleMapper from './styleMapper';

interface Props {
  type?: ButtonType;
  disabled?: boolean;
  children: React.ReactChild;
  onClick?: () => void;
}

interface StyledProps {
  buttonType: ButtonType;
}

const StyledButton = styled.button<StyledProps>`
  padding: 5px 16px;
  border: 1px solid ${({ theme }) => theme.palette.BORDER_COLOR};
  border-radius: 6px;
  cursor: pointer;
  ${({ buttonType }) => styleMapper(buttonType)}

  &:disabled {
    cursor: not-allowed;
    opacity: 0.8;
  }

  &:focus {
    outline: none;
  }
`;

const Button: FunctionComponent<Props> = ({
  type = 'default',
  disabled = false,
  children,
  onClick,
}) => (
  <StyledButton
    buttonType={type}
    type={type === 'primary' ? 'submit' : 'button'}
    disabled={disabled}
    onClick={onClick}
  >
    {children}
  </StyledButton>
);

export default Button;
