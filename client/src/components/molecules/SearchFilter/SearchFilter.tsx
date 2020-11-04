import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';

interface Props {
  label: string;
  optionHeader: string;
  options: string[];
  Icon: FunctionComponent;
  onClick: (e: React.MouseEvent<HTMLButtonElement>) => void;
  keys: number[];
}

const StyledSummary = styled.summary`
  padding: 5px 16px;
  font-size: 1rem;
  font-weight: 500;
  line-height: 20px;
  color: ${({ theme }) => theme.palette.PRIMARY};
  background-color: ${({ theme }) => theme.palette.LIGHT};
  border: 1px solid ${({ theme }) => theme.palette.BORDER_COLOR};
  border-radius: 6px 0 0 6px;
  display: inline-block;

  &::-webkit-details-marker {
    display: none;
  }

  &:hover {
    background-color: ${({ theme }) => theme.palette.BG_COLOR01};
  }

  &:focus {
    outline: none;
  }
`;
const StyledUl = styled.ul``;
const StyledLi = styled.li``;
const StyledButton = styled.button``;

const SearchFilter: FunctionComponent<Props> = ({
  label,
  optionHeader,
  options,
  Icon,
  onClick,
  keys,
}) => {
  return (
    <details>
      <StyledSummary>
        {label}
        <Icon />
      </StyledSummary>
      <StyledUl>
        <StyledLi>{optionHeader}</StyledLi>
        {options.map((option: string, i: number) => (
          <StyledLi key={keys[i]}>
            <StyledButton onClick={onClick}>{option}</StyledButton>
          </StyledLi>
        ))}
      </StyledUl>
    </details>
  );
};

export default SearchFilter;
