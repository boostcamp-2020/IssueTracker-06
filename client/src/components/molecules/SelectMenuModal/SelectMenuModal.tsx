import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';
import Input from '@components/atoms/Input';
import SelectMenuItem from '@components/molecules/SelectMenuModal/SelectMenuItem';

interface Props {
  optionHeader: string;
  options: string[];
  onClick: () => void;
  input?: string;
  keys: string[];
  display: 'block' | 'none';
}

interface StyledUlProps {
  display: 'block' | 'none';
}

interface StyledLiProps {
  input?: StringConstructor;
}

const StyledUl = styled.ul<StyledUlProps>`
  border-radius: 0.3rem;
  list-style: none;
  border: 1px solid ${({ theme }) => theme.palette.BORDER_COLOR};
  max-width: 300px;
  margin: 10px 0;
  display: ${({ display }) => display};
`;

const StyledLi = styled.li<StyledLiProps>`
  border-bottom: 1px solid ${({ theme }) => theme.palette.BORDER_COLOR};
  & > h3 {
    font-weight: 600;
  }

  & > button {
    width: 100%;
    text-align: left;
  }

  & > button,
  & > h3 {
    color: ${({ theme }) => theme.palette.PRIMARY};
    font-size: 0.8rem;
    padding: 7px 16px;
  }

  & > button:hover {
    background-color: ${({ theme }) => theme.palette.BG_COLOR02};
  }

  & > button:focus {
    outline: none;
  }

  &:last-child {
    border-bottom: none;
  }
`;

const SearchFilter: FunctionComponent<Props> = ({
  optionHeader,
  options,
  onClick,
  input,
  display,
  keys,
}) => {
  return (
    <StyledUl display={display}>
      <StyledLi>
        <h3>{optionHeader}</h3>
      </StyledLi>
      {input && <Input placeholder={input} type="text" />}
      {options.map((option: string, i: number) => (
        <StyledLi key={keys[i]}>
          <SelectMenuItem content={option} onClick={onClick} />
        </StyledLi>
      ))}
    </StyledUl>
  );
};

export default SearchFilter;
