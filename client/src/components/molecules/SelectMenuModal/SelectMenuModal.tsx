import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';
import Input from '@components/atoms/Input';
import SelectMenuItem from '@components/molecules/SelectMenuModal/SelectMenuItem';
import List from '@components/atoms/List';
import BoldText from '@components/atoms/BoldText';

interface Props {
  optionHeader: string;
  options: string[] | (() => JSX.Element[]);
  onClick?: () => void;
  onChange?: (e: React.ChangeEvent<HTMLInputElement>) => void;
  input?: string;
  placeholder?: string;
  keys: string[];
}

const StyledUl = styled.ul`
  border-radius: 0.3rem;
  list-style: none;
  border: 1px solid ${({ theme }) => theme.palette.BORDER_COLOR};
  max-width: 300px;
  margin: 10px 0;

  & > li {
    border-bottom: 1px solid ${({ theme }) => theme.palette.BORDER_COLOR};
  }

  &:first-child {
    font-weight: 600;
  }

  & > li > button {
    width: 100%;
    text-align: left;
  }

  & > li > button,
  & :first-child {
    color: ${({ theme }) => theme.palette.PRIMARY};
    font-size: 0.8rem;
    padding: 7px 16px;
  }

  & > li > button:hover {
    background-color: ${({ theme }) => theme.palette.BG_COLOR02};
  }

  & > li > button:focus {
    outline: none;
  }

  & > li > :last-child {
    border-bottom: none;
  }
`;

const SearchFilter: FunctionComponent<Props> = ({
  optionHeader,
  options,
  onClick,
  onChange,
  input,
  placeholder,
  keys,
}) => {
  return (
    <StyledUl>
      <List content={<BoldText value={optionHeader} />} />
      {input !== undefined && (
        <Input
          value={input}
          placeholder={placeholder}
          onChange={onChange}
          type="text"
        />
      )}
      {options.map((option: string, i: number) => (
        <List
          key={keys[i]}
          content={<SelectMenuItem content={option} onClick={onClick} />}
        />
      ))}
    </StyledUl>
  );
};

export default SearchFilter;
