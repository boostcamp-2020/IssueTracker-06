import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';
import Input from '@components/atoms/Input';
import BoldText from '@components/atoms/BoldText';

interface Props {
  optionHeader: string;
  children: React.ReactChild | React.ReactChild[];
  onChange?: (e: React.ChangeEvent<HTMLInputElement>) => void;
  inputValue?: string;
  placeholder?: string;
}

const StyledUl = styled.ul`
  border-radius: 0.3rem;
  list-style: none;
  border: 1px solid ${({ theme }) => theme.palette.BORDER_COLOR};
  max-width: 300px;
  margin: 10px 0;

  & > li {
    border-bottom: 1px solid ${({ theme }) => theme.palette.BORDER_COLOR};
    cursor: pointer;
  }

  &:first-child {
    font-weight: 600;
  }

  & > li > button {
    width: 100%;
    text-align: left;
  }

  & > li {
    color: ${({ theme }) => theme.palette.PRIMARY};
    font-size: 0.8rem;
    padding: 4px 8px;
  }

  & > li:hover {
    background-color: ${({ theme }) => theme.palette.BG_COLOR02};
  }

  & > li > :last-child {
    border-bottom: none;
  }
`;

const SearchFilter: FunctionComponent<Props> = ({
  optionHeader,
  children,
  onChange,
  inputValue,
  placeholder,
}) => {
  return (
    <StyledUl>
      <li>
        <BoldText value={optionHeader} />
      </li>
      {inputValue !== undefined && onChange && (
        <Input
          value={inputValue}
          placeholder={placeholder}
          onChange={onChange}
          type="text"
        />
      )}
      {children}
    </StyledUl>
  );
};

export default SearchFilter;
