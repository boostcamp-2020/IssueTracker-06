import React, { ChangeEvent, useState } from 'react';

import TextareaWithImgUpload from '.';

export default {
  title: 'Molecules/TextareaWithImgUpload',
  component: TextareaWithImgUpload,
};

export const Default = () => {
  const [value, setValue] = useState('');

  const onChange = (e: ChangeEvent<HTMLInputElement>) => {
    setValue(e.target.value);
  };
  return <TextareaWithImgUpload value={value} onChange={onChange} />;
};
