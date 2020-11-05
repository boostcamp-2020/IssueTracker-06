import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';
import { Input, FilterInput } from '@components/atoms/Input';

interface Props {
  optionHeader: string;
  options: string[];
  onClick?: () => void;
  onChange?: (e: React.ChangeEvent<HTMLInputElement>) => void;
  input?: string;
  type: string;
  keys: string[];
  display: string;
}

const StyledUl = styled.ul`
  border-radius: 0.3rem;
  list-style: none;
  border: 1px solid ${({ theme }) => theme.palette.BORDER_COLOR};
  max-width: 300px;
  margin: 10px 0;
`;

const StyledLi = styled.li`
  & > h3 {
    font-weight: 600;
  }

  & > input {
    width: 100%;
    text-align: left;
  }

  & > input,
  & > h3 {
    color: ${({ theme }) => theme.palette.PRIMARY};
    font-size: 0.8rem;
    padding: 7px 16px;
    border-bottom: 1px solid ${({ theme }) => theme.palette.BORDER_COLOR};
  }

  & > input:hover {
    background-color: ${({ theme }) => theme.palette.BG_COLOR02};
  }

  & > input:focus {
    outline: none;
  }
`;

const SearchFilter: FunctionComponent<Props> = ({
  optionHeader,
  options,
  onClick,
  type,
  input,
  display,
  keys,
}) => {
  return (
    <StyledUl style={{ display }}>
      <StyledLi>
        <h3>{optionHeader}</h3>
      </StyledLi>
      {input ? <Input placeholder={input} type="text" /> : <></>}
      {options.map((option: string, i: number) => (
        <StyledLi key={keys[i]}>
          <FilterInput type={type} content={option} onClick={onClick} />
        </StyledLi>
      ))}
    </StyledUl>
  );
};

export default SearchFilter;
