import React, { ChangeEvent, useState } from 'react';

import useChange from '@hooks/useChange';

import TextareaWithImgUpload from '.';

export default {
  title: 'Molecules/TextareaWithImgUpload',
  component: TextareaWithImgUpload,
};

export const Default = () => {
  const [value, , onChangeValue] = useChange<HTMLTextAreaElement>('');

  return <TextareaWithImgUpload value={value} onChange={onChangeValue} />;
};
