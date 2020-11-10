import React from 'react';
import { text } from '@storybook/addon-knobs';
import SelectMenuItem from '@components/molecules/SelectMenuModal/SelectMenuItem';

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

  return (
    <SelectMenuModal optionHeader={optionHeader}>
      <>
        {options.map((v) => (
          <li key={v}>
            <SelectMenuItem>{v}</SelectMenuItem>
          </li>
        ))}
      </>
    </SelectMenuModal>
  );
};

export const Author = () => {
  const [value, , onChangeValue] = useChange<HTMLInputElement>('');
  const optionHeader = text('optionHeader', 'Filter by author');
  const options = ['user1', 'user2', 'user3', 'user4', 'user5'];

  const placeholder = 'Filter users';

  return (
    <SelectMenuModal
      optionHeader={optionHeader}
      onChange={onChangeValue}
      inputValue={value}
      placeholder={placeholder}
    >
      <>
        {options.map((v) => (
          <li key={v}>
            <SelectMenuItem>{v}</SelectMenuItem>
          </li>
        ))}
      </>
    </SelectMenuModal>
  );
};
