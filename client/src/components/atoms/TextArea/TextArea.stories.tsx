import React from 'react';
import { text } from '@storybook/addon-knobs';
import Textarea from './TextArea';

export default {
  title: 'Atoms/Textarea',
  component: Textarea,
};

export const Default = () => {
  const placeholder = text('placeholder', 'Leave a comment');
  const textAreaHeight = text('height', '200px');
  const textAreaWidth = text('width', '200px');
  return (
    <Textarea
      placeHolder={placeholder}
      textAreaHeight={textAreaHeight}
      textAreaWidth={textAreaWidth}
    />
  );
};
