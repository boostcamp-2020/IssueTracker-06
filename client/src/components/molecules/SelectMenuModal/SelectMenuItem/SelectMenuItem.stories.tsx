import React, { useState } from 'react';
import { text } from '@storybook/addon-knobs';
import SelectMenuItemLabel from '@/components/molecules/SelectMenuModal/SelectMenuItem/SelectMenuItemLabel';
import SelectMenuItem from './SelectMenuItem';

export default {
  component: SelectMenuItem,
  title: 'Molecules/SelectMenuItem',
};
export const Default = () => {
  const content = <SelectMenuItemLabel swatchColor="#eee" title="1" />;
  const onClick = () => {
    // 버튼 메서드
  };
  return <SelectMenuItem content={content} onClick={onClick} />;
};
