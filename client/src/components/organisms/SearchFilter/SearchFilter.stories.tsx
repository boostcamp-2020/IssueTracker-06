import React, { useState } from 'react';
import { text } from '@storybook/addon-knobs';
import { Dropdown } from '@components/atoms/icons';
import FilterItemLabel from '@/components/molecules/FilterModal/FilterModalButton/filterItem/FilterItemLabel';
import SearchFilter from './SearchFilter';

export default {
  component: SearchFilter,
  title: 'Organisms/SearchFilter',
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
  const keys = ['search1', 'search2', 'search3', 'search4', 'search5'];
  return (
    <SearchFilter
      label={label}
      optionHeader={optionHeader}
      options={options}
      Icon={Icon}
      onClick={onClick}
      display={display}
      keys={keys}
    />
  );
};

export const Label = () => {
  const [display, setDisplay] = useState('none');
  const label = text('label', 'Label');
  const optionHeader = text('optionHeader', 'Filter by label');
  const options = [
    <FilterItemLabel
      key="label1"
      swatchColor="#eee"
      title="1번"
      description="1번1번"
    />,
    <FilterItemLabel key="label2" swatchColor="#ddd" title="2번" />,
    <FilterItemLabel
      key="label3"
      swatchColor="#ccc"
      title="3번"
      description="3번3번"
    />,
    <FilterItemLabel key="label4" swatchColor="#bbb" title="4번" />,
    <FilterItemLabel
      key="label5"
      swatchColor="#aaa"
      title="5번"
      description="5번5번"
    />,
  ];
  const Icon = Dropdown;
  const onClick = () => {
    if (display === 'none') setDisplay('block');
    else setDisplay('none');
  };
  const keys = ['label1', 'label2', 'label3', 'label4', 'label5'];
  const input = 'Filter labels';
  return (
    <SearchFilter
      label={label}
      optionHeader={optionHeader}
      options={options}
      Icon={Icon}
      onClick={onClick}
      display={display}
      input={input}
      keys={keys}
    />
  );
};
