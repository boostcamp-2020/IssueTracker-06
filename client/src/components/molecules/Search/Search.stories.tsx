import React, { useState } from 'react';
import { text } from '@storybook/addon-knobs';

import Search from '.';

export default {
  title: 'Molecules/Search',
  component: Search,
};

export const Defalut = () => {
  const [value, setValue] = useState('');
  const placeholder = text('placeholder', '');

  const onChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setValue(e.target.value);
  };

  return <Search value={value} onChange={onChange} placeholder={placeholder} />;
};
