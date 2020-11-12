import React, { FunctionComponent, useCallback } from 'react';

import styled from '@themes/styled';
import Filter from '@components/organisms/Filter';
import { DropdownIcon } from '@components/atoms/icons';

interface Props {
  checkedCount: number;
  onCheckIssueListHeader: (isChecked: boolean) => void;
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

const IssueListFilterHeader: FunctionComponent<Props> = ({
  checkedCount,
  onCheckIssueListHeader,
}) => {
  const onChangeCheck = useCallback(
    (e: React.ChangeEvent<HTMLInputElement>) => {
      onCheckIssueListHeader(e.target.checked);
    },
    [onCheckIssueListHeader],
  );

  return (
    <StyledIssueListFilterHeader>
      <div className="section-selected">
        <input type="checkbox" onChange={onChangeCheck} />
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
};

export default IssueListFilterHeader;
