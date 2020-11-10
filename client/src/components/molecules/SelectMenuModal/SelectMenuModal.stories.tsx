import React, { useState } from 'react';
import { text } from '@storybook/addon-knobs';

import useChange from '@hooks/useChange';

import SelectMenuModal from './SelectMenuModal';

export default {
  component: SelectMenuModal,
  title: 'Molecules/SelectMenuModal',
};
export const Default = () => {
  const optionHeader = text('optionHeader', 'Filter Issues');
  const options = [
    'Open issues',
    'Your issues',
    'Everything assigned to you',
    'Everything mentioning to you',
    'Closed issues',
  ];

  const keys = ['search1', 'search2', 'search3', 'search4', 'search5'];
  const onClick = () => {
    // modal button 클릭 시
  };

  return (
    <SelectMenuModal
      display="block"
      optionHeader={optionHeader}
      options={options}
      onClick={onClick}
      keys={keys}
    />
  );
};

export const Author = () => {
  const [value, , onChangeValue] = useChange<HTMLInputElement>('');
  const optionHeader = text('optionHeader', 'Filter by author');
  const options = ['user1', 'user2', 'user3', 'user4', 'user5'];
  const onClick = () => {
    // modal button 클릭 시
  };

  const keys = ['radio1', 'radio2', 'radio3', 'radio4', 'radio5'];
  const placeholder = 'Filter users';

  return (
    <SelectMenuModal
      display="block"
      optionHeader={optionHeader}
      options={options}
      onClick={onClick}
      onChange={onChangeValue}
      inputValue={value}
      placeholder={placeholder}
      keys={keys}
    />
  );
};
