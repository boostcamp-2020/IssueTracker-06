import React, { ChangeEvent, useState } from 'react';

import useChange from '@hooks/useChange';

import WriteForm from '.';

export default {
  title: 'Organisms/WriteForm',
  component: WriteForm,
};

export const Default = () => {
  const [title, , onChangeTitle] = useChange<HTMLInputElement>('');
  const [content, , onChangeContent] = useChange<HTMLTextAreaElement>('');

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
  const [content, , onChangeContent] = useChange<HTMLTextAreaElement>('');

  return <WriteForm content={content} onChangeContent={onChangeContent} />;
};
