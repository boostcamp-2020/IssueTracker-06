import React, { FunctionComponent, useCallback, useState } from 'react';

import styled from '@themes/styled';
import Filter from '@components/organisms/Filter';
import Search from '@components/molecules/Search';
import SelectMenuItem from '@components/molecules/SelectMenuModal/SelectMenuItem';
import PlainText from '@components/atoms/PlainText';
import { DropdownIcon } from '@components/atoms/icons';

interface Props {
  value: string;
  onChange: (e: React.ChangeEvent<HTMLInputElement>) => void;
  onClickOpenFilter: (isOpen: boolean) => void;
}

const options = [
  'Open issues',
  'Your issues',
  'Everything assigned to you',
  'Everything mentioning to you',
  'Closed issues',
];

const optionsFilter = [true, null, null, null, false];

const StyledSearchWithFilter = styled.form`
  display: flex;

  & > button {
    position: relative;
    border-top-right-radius: 0;
    border-bottom-right-radius: 0;
  }

  & > div {
    flex-grow: 1;

    & > input {
      border-top-left-radius: 0;
      border-bottom-left-radius: 0;
      border-left: none;
    }
  }
`;

const SearchWithFilter: FunctionComponent<Props> = ({
  value,
  onChange,
  onClickOpenFilter,
}) => {
  const [isShowFilterOptions, setIsShowFilterOptions] = useState(false);

  const onOpenFilter = useCallback(() => {
    setIsShowFilterOptions(!isShowFilterOptions);
  }, [isShowFilterOptions]);

  const onSearchFilter = useCallback((e: React.FormEvent) => {
    e.preventDefault();
    setIsShowFilterOptions(false);
  }, []);

  return (
    <StyledSearchWithFilter onSubmit={onSearchFilter}>
      <Filter
        type="default"
        label="filter"
        optionHeader="Filter Issues"
        Icon={DropdownIcon}
        isShow={isShowFilterOptions}
        onClick={onOpenFilter}
      >
        {options.map((option, i) => (
          <SelectMenuItem
            key={`main_filter_${option}`}
            onClick={() =>
              optionsFilter[i] !== null &&
              onClickOpenFilter(optionsFilter[i] as boolean)
            }
          >
            <PlainText value={option} />
          </SelectMenuItem>
        ))}
      </Filter>
      <Search value={value} onChange={onChange} />
    </StyledSearchWithFilter>
  );
};

export default SearchWithFilter;
