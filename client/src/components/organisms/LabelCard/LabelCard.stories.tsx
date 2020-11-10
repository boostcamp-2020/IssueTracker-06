import React, { useState } from 'react';
import { text, color } from '@storybook/addon-knobs';
import PlainText from '@components/atoms/PlainText';
import LabelCard from './LabelCard';

export default {
  component: LabelCard,
  title: 'Organisms/LabelCard',
};
export const Default = () => {
  const title = text('title', 'Bug');
  const bgColor = color('background color', 'rgba(163,10,10,100)');
  const hexColor = bgColor
    .slice(5, -1)
    .split(',')
    .map((v) => Number(v).toString(16).padStart(2, '0'))
    .join('')
    .slice(0, 6);
  const description = text('description', 'api develop');
  return <LabelCard data={{ id: 0, name: title, color: `#${hexColor}` }} />;
};
