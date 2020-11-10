import React, { useState } from 'react';
import { text, select } from '@storybook/addon-knobs';
import { DropdownIcon } from '@components/atoms/icons';
import SelectMenuItemLabel from '@components/molecules/SelectMenuModal/SelectMenuItem/SelectMenuItemLabel';
import SelectMenuItemUser from '@components/molecules/SelectMenuModal/SelectMenuItem/SelectMenuItemUser';
import PlainText from '@components/atoms/PlainText';
import SearchFilter from './SearchFilter';

export default {
  component: SearchFilter,
  title: 'Organisms/SearchFilter',
};
export const Default = () => {
  const [isShow, changeShow] = useState(false);
  const type = select(
    'type',
    ['default', 'transparent', 'primary', 'error'],
    'default',
  );
  const label = text('label', 'filter');
  const optionHeader = text('optionHeader', 'Filter Issues');
  const options = (
    <>
      <PlainText value="Open issues" />
      {/* 'Your issues',
    'Everything assigned to you',
    'Everything mentioning to you',
    'Closed issues', */}
    </>
  );
  const onClick = () => {
    changeShow(!isShow);
  };
  const keys = ['search1', 'search2', 'search3', 'search4', 'search5'];
  return (
    <SearchFilter
      type={type}
      label={label}
      optionHeader={optionHeader}
      options={options}
      Icon={DropdownIcon}
      onClick={onClick}
      isShow={isShow}
      keys={keys}
    />
  );
};

export const Label = () => {
  const [isShow, changeShow] = useState(false);
  const type = select(
    'type',
    ['default', 'transparent', 'primary', 'error'],
    'transparent',
  );
  const label = text('label', 'Label');
  const optionHeader = text('optionHeader', 'Filter by label');
  const options = (
    <>
      <SelectMenuItemLabel
        key="label1"
        swatchColor="#eee"
        title="1번"
        description="1번1번"
      />
      ,
      <SelectMenuItemLabel key="label2" swatchColor="#ddd" title="2번" />
      ,
      <SelectMenuItemLabel
        key="label3"
        swatchColor="#ccc"
        title="3번"
        description="3번3번"
      />
      ,
      <SelectMenuItemLabel key="label4" swatchColor="#bbb" title="4번" />
      ,
      <SelectMenuItemLabel
        key="label5"
        swatchColor="#aaa"
        title="5번"
        description="5번5번"
      />
      ,
    </>
  );
  const onClick = () => {
    changeShow(!isShow);
  };
  const keys = ['label1', 'label2', 'label3', 'label4', 'label5'];
  const input = 'Filter labels';
  return (
    <SearchFilter
      type={type}
      label={label}
      optionHeader={optionHeader}
      options={options}
      Icon={DropdownIcon}
      onClick={onClick}
      isShow={isShow}
      input={input}
      keys={keys}
    />
  );
};

export const User = () => {
  const [isShow, changeShow] = useState(false);
  const type = select(
    'type',
    ['default', 'transparent', 'primary', 'error'],
    'transparent',
  );
  const label = text('label', 'Author');
  const optionHeader = text('optionHeader', 'Filter by Author');
  const options = () => (
    <>
      <SelectMenuItemUser
        key="user1"
        userImgSrc="https://avatars0.githubusercontent.com/u/37282087?s=40&amp;v=4"
        title="user1"
        alt="user1"
      />
      <SelectMenuItemUser
        key="user2"
        userImgSrc="https://avatars0.githubusercontent.com/u/37282087?s=40&amp;v=4"
        title="user2"
        alt="user2"
      />
      <SelectMenuItemUser
        key="user3"
        userImgSrc="https://avatars0.githubusercontent.com/u/37282087?s=40&amp;v=4"
        title="user3"
        alt="user3"
      />
      <SelectMenuItemUser
        key="user4"
        userImgSrc="https://avatars0.githubusercontent.com/u/37282087?s=40&amp;v=4"
        title="user4"
        alt="user4"
      />
      <SelectMenuItemUser
        key="user5"
        userImgSrc="https://avatars0.githubusercontent.com/u/37282087?s=40&amp;v=4"
        title="user5"
        alt="user5"
      />
    </>
  );
  const onClick = () => {
    changeShow(!isShow);
  };
  const keys = ['user1', 'user2', 'user3', 'user4', 'user5'];
  const input = 'Filter users';
  return (
    <SearchFilter
      type={type}
      label={label}
      optionHeader={optionHeader}
      options={options}
      Icon={DropdownIcon}
      onClick={onClick}
      isShow={isShow}
      input={input}
      keys={keys}
    />
  );
};
