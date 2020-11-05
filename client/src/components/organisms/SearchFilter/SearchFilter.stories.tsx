import React, { useState } from 'react';
import { text } from '@storybook/addon-knobs';
import { Dropdown } from '@components/atoms/icons';
import SearchFilter from './SearchFilter';

export default {
  component: SearchFilter,
  title: 'SearchFilter',
};
export const Default = () => {
  const [display, setDisplay] = useState('none');
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
  const onClick = () => {
    if (display === 'none') setDisplay('block');
    else setDisplay('none');
  };
  const type = 'button';
  const keys = ['search1', 'search2', 'search3', 'search4', 'search5'];
  return (
    <SearchFilter
      label={label}
      optionHeader={optionHeader}
      options={options}
      Icon={Icon}
      onClick={onClick}
      display={display}
      type={type}
      keys={keys}
    />
  );
};

export const Author = () => {
  const [display, setDisplay] = useState('none');
  const label = text('label', 'Author');
  const optionHeader = text('optionHeader', 'Filter by author');
  const options = ['user1', 'user2', 'user3', 'user4', 'user5'];
  const Icon = Dropdown;
  const onClick = () => {
    if (display === 'none') setDisplay('block');
    else setDisplay('none');
  };
  const type = 'checkbox';
  const keys = ['radio1', 'radio2', 'radio3', 'radio4', 'radio5'];
  const input = 'Filter users';
  return (
    <SearchFilter
      label={label}
      optionHeader={optionHeader}
      options={options}
      Icon={Icon}
      onClick={onClick}
      display={display}
      type={type}
      input={input}
      keys={keys}
    />
  );
};
