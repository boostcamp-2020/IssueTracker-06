import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';

const StyledFilterButton = styled.button`
  all: unset;
  color: ${({ theme }) => theme.palette.SECONDARY};
  font-size: 0.8rem;
  &:hover {
    color: ${({ theme }) => theme.palette.PRIMARY};
    cursor: pointer;
  }
`;

interface Props {
  onClick: () => void;
  text: string;
}

const FilterButton: FunctionComponent<Props> = ({ onClick, text }) => (
  <StyledFilterButton onClick={onClick}>{text} ▾</StyledFilterButton>
);

export default FilterButton;
