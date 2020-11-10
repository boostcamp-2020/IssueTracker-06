import React, { useState } from 'react';
import { text, select } from '@storybook/addon-knobs';

import useChange from '@hooks/useChange';
import { DropdownIcon } from '@components/atoms/icons';
import SelectMenuItemLabel from '@components/molecules/SelectMenuModal/SelectMenuItem/SelectMenuItemLabel';
import SelectMenuItemUser from '@components/molecules/SelectMenuModal/SelectMenuItem/SelectMenuItemUser';
import SelectMenuItem from '@components/molecules/SelectMenuModal/SelectMenuItem';
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
  const onClick = () => {
    changeShow(!isShow);
  };
  return (
    <SearchFilter
      type={type}
      label={label}
      optionHeader={optionHeader}
      Icon={DropdownIcon}
      onClick={onClick}
      isShow={isShow}
    >
      <>
        <li>
          <SelectMenuItem>
            <PlainText value="Open issues" />
          </SelectMenuItem>
        </li>
        <li>
          <SelectMenuItem>
            <PlainText value="Your issues" />
          </SelectMenuItem>
        </li>
        <li>
          <SelectMenuItem>
            <PlainText value="Everything assigned to you" />
          </SelectMenuItem>
        </li>
        <li>
          <SelectMenuItem>
            <PlainText value="Everything mentioning to you" />
          </SelectMenuItem>
        </li>
        <li>
          <SelectMenuItem>
            <PlainText value="Closed issues" />
          </SelectMenuItem>
        </li>
      </>
    </SearchFilter>
  );
};

export const Label = () => {
  const [value, , onChangeValue] = useChange<HTMLInputElement>('');
  const [isShow, changeShow] = useState(false);
  const type = select(
    'type',
    ['default', 'transparent', 'primary', 'error'],
    'transparent',
  );
  const label = text('label', 'Label');
  const optionHeader = text('optionHeader', 'Filter by label');

  const onClick = () => {
    changeShow(!isShow);
  };
  return (
    <SearchFilter
      type={type}
      label={label}
      optionHeader={optionHeader}
      Icon={DropdownIcon}
      onClick={onClick}
      isShow={isShow}
      inputValue={value}
      onChange={onChangeValue}
    >
      <>
        <SelectMenuItemLabel
          key="label1"
          swatchColor="#eee"
          title="1번"
          description="1번1번"
        />
        <SelectMenuItemLabel key="label2" swatchColor="#ddd" title="2번" />
        <SelectMenuItemLabel
          key="label3"
          swatchColor="#ccc"
          title="3번"
          description="3번3번"
        />
        <SelectMenuItemLabel key="label4" swatchColor="#bbb" title="4번" />
        <SelectMenuItemLabel
          key="label5"
          swatchColor="#aaa"
          title="5번"
          description="5번5번"
        />
      </>
    </SearchFilter>
  );
};

export const User = () => {
  const [value, , onChangeValue] = useChange<HTMLInputElement>('');
  const [isShow, changeShow] = useState(false);
  const type = select(
    'type',
    ['default', 'transparent', 'primary', 'error'],
    'transparent',
  );
  const label = text('label', 'Author');
  const optionHeader = text('optionHeader', 'Filter by Author');

  const onClick = () => {
    changeShow(!isShow);
  };
  return (
    <SearchFilter
      type={type}
      label={label}
      optionHeader={optionHeader}
      Icon={DropdownIcon}
      onClick={onClick}
      isShow={isShow}
      inputValue={value}
      onChange={onChangeValue}
    >
      <>
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
      </>
    </SearchFilter>
  );
};
