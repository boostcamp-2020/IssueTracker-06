import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';

import { SearchIcon } from '@/components/atoms/icons';

interface Props {
  value: string;
  placeholder?: string;
  onChange: (e: React.ChangeEvent<HTMLInputElement>) => void;
}

const StyledSearch = styled.div`
  color: ${({ theme }) => theme.palette.SECONDARY};

  & > input {
    position: relative;
    width: 100%;
    font-size: 1rem;
    background-color: ${({ theme }) => theme.palette.BG_COLOR01};
    padding: 5px 12px 5px 32px;
    line-height: 1.5rem;
    border: 1px solid ${({ theme }) => theme.palette.BORDER_COLOR};
    border-radius: 0.3rem;
    box-sizing: border-box;
    color: currentColor;

    &:focus {
      outline: none;
      border: 1px solid ${({ theme }) => theme.palette.LINK_BLUE};
      box-shadow: 0 0 0 3px ${({ theme }) => theme.palette.BLUE_SHADOW};
    }
  }

  & > svg {
    position: absolute;
    height: 1rem;
    fill: currentColor;
    left: 8px;
    top: 9px;
  }
`;

const Search: FunctionComponent<Props> = ({
  value,
  placeholder = '',
  onChange,
}) => (
  <StyledSearch>
    <input
      type="text"
      value={value}
      onChange={onChange}
      placeholder={placeholder}
    />
    <SearchIcon />
  </StyledSearch>
);

export default Search;
