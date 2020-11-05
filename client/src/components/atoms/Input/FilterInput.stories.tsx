import React, { useState } from 'react';
import { text } from '@storybook/addon-knobs';
import FilterInput from './FilterInput';

export default {
  component: FilterInput,
  title: 'FilterInput',
};
export const Default = () => {
  const content = text('content', 'content');
  const type = text('type', 'button');
  const onClick = () => {
    // 버튼 메서드
  };
  return <FilterInput type={type} content={content} onClick={onClick} />;
};
