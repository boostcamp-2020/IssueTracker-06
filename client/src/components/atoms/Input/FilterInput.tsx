import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';

interface Props {
  content: string;
  onClick?: () => void;
  onChange?: (e: React.ChangeEvent<HTMLInputElement>) => void;
  type: string;
}

const StyledInput = styled.input`
  font-size: 1rem;
  text-decoration: none;
  border: none;
  background-color: rgba(0, 0, 0, 0);
  cursor: pointer;

  &:focus {
    outline: none;
  }
`;

const FilterInput: FunctionComponent<Props> = ({
  type,
  content,
  onClick,
  onChange,
}) => {
  return (
    <StyledInput
      type={type}
      onClick={onClick}
      onChange={onChange}
      value={content}
    />
  );
};

export default FilterInput;
