import React from 'react';
import { text, number } from '@storybook/addon-knobs';

import useChange from '@hooks/useChange';

import Textarea from './TextArea';

export default {
  title: 'Atoms/Textarea',
  component: Textarea,
};

export const Default = () => {
  const [value, , onChnageValue] = useChange<HTMLTextAreaElement>('');

  const placeholder = text('placeholder', 'Leave a comment');
  const textAreaHeight = number('height', 200);
  const textAreaWidth = number('width', 200);
  return (
    <Textarea
      placeHolder={placeholder}
      textAreaHeight={`${textAreaHeight}px`}
      textAreaWidth={`${textAreaWidth}px`}
      value={value}
      onChange={onChnageValue}
    />
  );
};
