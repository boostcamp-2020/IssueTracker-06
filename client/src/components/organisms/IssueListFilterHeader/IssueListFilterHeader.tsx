import React, { FunctionComponent } from 'react';

import styled from '@themes/styled';
import Filter from '@components/organisms/Filter';
import { DropdownIcon } from '@components/atoms/icons';

interface Props {
  checkedCount: number;
}

const StyledIssueListFilterHeader = styled.header`
  padding: 16px;
  background-color: ${({ theme }) => theme.palette.BG_COLOR02};
  color: ${({ theme }) => theme.palette.SECONDARY};
  border: 1px solid ${({ theme }) => theme.palette.BORDER_COLOR};
  border-top-left-radius: 6px;
  border-top-right-radius: 6px;
  display: flex;
  justify-content: space-between;

  & .section-selected {
    display: flex;

    & > input {
      margin: 0;
    }
    & > span {
      font-size: 0.8rem;
      margin-left: 8px;
    }
  }

  & .filter-list {
    & button {
      padding: 0 14px;
    }
    & span {
      color: ${({ theme }) => theme.palette.SECONDARY};
      font-size: 0.8rem;
    }

    & svg {
      height: 0.8rem;
    }
  }
`;

const filters = [
  'Author',
  'Label',
  'Projects',
  'Milestones',
  'Assignee',
  'Sort',
];

const IssueListFilterHeader: FunctionComponent<Props> = ({ checkedCount }) => (
  <StyledIssueListFilterHeader>
    <div className="section-selected">
      <input type="checkbox" />
      {checkedCount !== 0 && <span>{`${checkedCount} selected`}</span>}
    </div>
    <div className="filter-list">
      {filters.map((filter) => (
        <Filter
          key={`main_filter_header_${filter}`}
          type="transparent"
          label={filter}
          Icon={DropdownIcon}
          optionHeader={`Fillter by ${filter}`}
          isShow={false}
        >
          <span />
        </Filter>
      ))}
    </div>
  </StyledIssueListFilterHeader>
);

export default IssueListFilterHeader;
