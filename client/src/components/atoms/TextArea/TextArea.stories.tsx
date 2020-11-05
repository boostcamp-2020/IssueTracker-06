import React from 'react';
import { text } from '@storybook/addon-knobs';
import Textarea from './TextArea';

export default {
  title: 'Components/Textarea',
  component: Textarea,
};

export const Default = () => {
  const placeholder = text('placeholder', 'Leave a comment');
  return <Textarea placeHolder={placeholder} />;
};
