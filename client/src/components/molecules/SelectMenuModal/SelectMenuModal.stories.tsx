import React from 'react';
import { text } from '@storybook/addon-knobs';
import SelectMenuItem from '@components/molecules/SelectMenuModal/SelectMenuItem';
import SelectMenuItemUser from '@components/molecules/SelectMenuModal/SelectMenuItem/SelectMenuItemUser';

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
      {options.map((v) => (
        <SelectMenuItem key={v}>{v}</SelectMenuItem>
      ))}
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
      <SelectMenuItemUser
        key="user1"
        userImgSrc="https://avatars0.githubusercontent.com/u/37282087?s=40&amp;v=4"
        title="user1"
      />
      <SelectMenuItemUser
        key="user2"
        userImgSrc="https://avatars0.githubusercontent.com/u/37282087?s=40&amp;v=4"
        title="user2"
      />
      <SelectMenuItemUser
        key="user3"
        userImgSrc="https://avatars0.githubusercontent.com/u/37282087?s=40&amp;v=4"
        title="user3"
      />
      <SelectMenuItemUser
        key="user4"
        userImgSrc="https://avatars0.githubusercontent.com/u/37282087?s=40&amp;v=4"
        title="user4"
      />
      <SelectMenuItemUser
        key="user5"
        userImgSrc="https://avatars0.githubusercontent.com/u/37282087?s=40&amp;v=4"
        title="user5"
      />
    </SelectMenuModal>
  );
};
