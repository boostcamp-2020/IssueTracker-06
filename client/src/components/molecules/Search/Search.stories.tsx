import React, { useState } from 'react';
import { text } from '@storybook/addon-knobs';

import useChange from '@hooks/useChange';

import Search from '.';

export default {
  title: 'Molecules/Search',
  component: Search,
};

export const Defalut = () => {
  const [value, , onChangeValue] = useChange('');
  const placeholder = text('placeholder', '');

  return (
    <Search value={value} onChange={onChangeValue} placeholder={placeholder} />
  );
};
