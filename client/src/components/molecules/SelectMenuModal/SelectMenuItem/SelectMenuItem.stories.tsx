import React, { useState } from 'react';
import { text, color } from '@storybook/addon-knobs';
import SelectMenuItemLabel from '@/components/molecules/SelectMenuModal/SelectMenuItem/SelectMenuItemLabel';
import SelectMenuItem from './SelectMenuItem';

export default {
  component: SelectMenuItem,
  title: 'Molecules/SelectMenuItem',
};
export const Default = () => {
  const title = text('content', '1');
  const pickedColor = color('color', '#eee');
  const content = (
    <SelectMenuItemLabel swatchColor={pickedColor} title={title} />
  );
  const onClick = () => {
    // 버튼 메서드
  };
  return <SelectMenuItem content={content} onClick={onClick} />;
};
