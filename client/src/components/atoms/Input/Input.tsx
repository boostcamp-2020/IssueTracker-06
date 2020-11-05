import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';

interface Props {
  placeholder?: string;
  value?: string;
  type: string;
  onChange?: (e: React.ChangeEvent<HTMLInputElement>) => void;
}

const StyledInput = styled.input`
  width: 100%;
  font-size: 1rem;
  background-color: ${({ theme }) => theme.palette.BG_COLOR01};
  padding: 5px 12px;
  line-height: 1.5rem;
  color: ${({ theme }) => theme.palette.PRIMARY};
  border: 1px solid ${({ theme }) => theme.palette.BORDER_COLOR};
  border-radius: 0.3rem;
  outline: none;

  &:focus {
    border: 1px solid ${({ theme }) => theme.palette.LINK_BLUE};
    outline: none;
    box-shadow: 0 0 0 3px ${({ theme }) => theme.palette.BLUE_SHADOW};
  }
`;

const Input: FunctionComponent<Props> = ({
  placeholder = 'Input',
  value = '',
  type,
  onChange,
}) => {
  return (
    <StyledInput
      type={type}
      placeholder={placeholder}
      value={value}
      onChange={onChange}
    />
  );
};

export default Input;
