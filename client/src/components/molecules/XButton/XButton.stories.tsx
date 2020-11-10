import React from 'react';
import { text } from '@storybook/addon-knobs';
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
  const onClick = () => {
    // 필터 초기화
  };
  return <XButton content={content} onClick={onClick} />;
};
