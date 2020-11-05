import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';
import FilterModal from '@components/molecules/SelectMenuModal';

interface Props {
  label: string;
  optionHeader: string;
  options: string[] | Element[];
  Icon: FunctionComponent;
  onClick: () => void;
  input?: string;
  display: 'none' | 'display';
  keys: string[];
}

const StyledButton = styled.button`
  padding: 5px 16px;
  font-size: 1rem;
  font-weight: 500;
  line-height: 20px;
  color: ${({ theme }) => theme.palette.PRIMARY};
  background-color: ${({ theme }) => theme.palette.LIGHT};
  border: 1px solid ${({ theme }) => theme.palette.BORDER_COLOR};
  border-radius: 0.3rem 0 0 0.3rem;
  display: inline-block;
  cursor: pointer;

  & > svg {
    margin-left: 4px;
    display: inline-block;
    width: 0.8rem;
    height: 0.8rem;
    vertical-align: middle;
    fill: currentColor;
  }

  &:hover {
    background-color: ${({ theme }) => theme.palette.BG_COLOR02};
  }

  &:focus {
    outline: none;
  }
`;

const SearchFilter: FunctionComponent<Props> = ({
  label,
  optionHeader,
  options,
  Icon,
  onClick,
  display,
  input,
  keys,
}) => {
  return (
    <>
      <StyledButton onClick={onClick}>
        {label}
        <Icon />
      </StyledButton>

      <FilterModal
        display={display}
        optionHeader={optionHeader}
        input={input}
        options={options}
        keys={keys}
      />
    </>
  );
};

export default SearchFilter;
