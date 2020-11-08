import React from 'react';
import { text } from '@storybook/addon-knobs';
import { Reset } from '@components/atoms/icons';
import XButton from './XButton';

export default {
  component: XButton,
  title: 'Molecules/XButton',
};
export const Default = () => {
  const content = text(
    'content',
    'Clear current search query, filters, and sorts',
  );
  const Icon = Reset;
  const onClick = () => {
    // 필터 초기화
  };
  return <XButton Icon={Icon} content={content} onClick={onClick} />;
};
