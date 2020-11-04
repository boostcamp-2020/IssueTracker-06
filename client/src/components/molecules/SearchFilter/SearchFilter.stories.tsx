import React, { useState } from 'react';
import { text } from '@storybook/addon-knobs';
import { Dropdown } from '@components/atoms/Icons';
import SearchFilter from './SearchFilter';

export default {
  component: SearchFilter,
  title: 'SearchFilter',
};
export const Default = () => {
  const label = text('label', 'filter');
  const optionHeader = text('optionHeader', 'Filter Issues');
  const options = [
    'Open issues',
    'Your issues',
    'Everything assigned to you',
    'Everything mentioning to you',
    'Closed issues',
  ];
  const Icon = Dropdown;
  const onClick = (e: React.MouseEvent<HTMLButtonElement>) => {
    console.log(e.target.value);
  };
  const keys = [1,2,3,4,5];
  return (
    <SearchFilter
      label={label}
      optionHeader={optionHeader}
      options={options}
      Icon={Icon}
      onClick={onClick}
      keys={keys}
    />
  );
};
