import React, { useState } from 'react';
import { text, color } from '@storybook/addon-knobs';
import LabelForm from './LabelForm';

export default {
  component: LabelForm,
  title: 'Organisms/LabelForm',
};
export const Default = () => {
  const title = text('title', 'Bug');
  const bgColor = color('background color', 'rgba(163,10,10,100)');
  const hexColor = `#${bgColor
    .slice(5, -1)
    .split(',')
    .map((v) => Number(v).toString(16).padStart(2, '0'))
    .join('')
    .slice(0, 6)}`;
  const [btnColor, setColor] = useState(hexColor);
  const onClick = () => {
    const letters = '0123456789ABCDEF';
    let randomColor = '#';
    for (let i = 0; i < 6; i += 1) {
      randomColor += letters[Math.floor(Math.random() * 16)];
    }
    setColor(randomColor);
  };
  const description = text('description', 'api develop');
  return (
    <LabelForm
      title={title}
      bgColor={btnColor}
      description={description}
      onClick={onClick}
    />
  );
};
