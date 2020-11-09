import React, { ChangeEvent, useState } from 'react';
import { text } from '@storybook/addon-knobs';

import WriteForm from '.';

export default {
  title: 'Organisms/WriteForm',
  component: WriteForm,
};

export const Default = () => {
  const [title, setTitle] = useState('');
  const [content, setContent] = useState('');

  const onChangeTitle = (e: ChangeEvent<HTMLInputElement>) => {
    setTitle(e.target.value);
  };

  const onChangeContent = (e: ChangeEvent<HTMLInputElement>) => {
    setContent(e.target.value);
  };

  return (
    <WriteForm
      title={title}
      content={content}
      onChangeTitle={onChangeTitle}
      onChangeContent={onChangeContent}
    />
  );
};

export const OnlyContent = () => {
  const [content, setContent] = useState('');

  const onChangeContent = (e: ChangeEvent<HTMLInputElement>) => {
    setContent(e.target.value);
  };

  return <WriteForm content={content} onChangeContent={onChangeContent} />;
};
