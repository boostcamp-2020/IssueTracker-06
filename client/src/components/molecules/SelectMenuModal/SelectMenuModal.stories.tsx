import React from 'react';
import { text } from '@storybook/addon-knobs';
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
  const type = 'button';
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
  const optionHeader = text('optionHeader', 'Filter by author');
  const options = ['user1', 'user2', 'user3', 'user4', 'user5'];
  const onClick = () => {
    // modal button 클릭 시
  };
  const type = 'checkbox';
  const keys = ['radio1', 'radio2', 'radio3', 'radio4', 'radio5'];
  const input = 'Filter users';
  return (
    <SelectMenuModal
      display="block"
      optionHeader={optionHeader}
      options={options}
      onClick={onClick}
      input={input}
      keys={keys}
    />
  );
};
