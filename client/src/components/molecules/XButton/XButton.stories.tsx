import React from 'react';
import { text } from '@storybook/addon-knobs';
import { Reset } from '@components/atoms/Icons';
import XButton from './XButton';

export default {
  component: XButton,
  title: 'XButton',
};
export const Default = () => {
  const value = text('value', 'Clear current search query, filters, and sorts');
  const Icon = Reset;
  const onClick = (e: React.ChangeEvent<HTMLInputElement>) => {
    // 필터 초기화
  };
  return <XButton Icon={Icon} value={value} onClick={onClick} />;
};
