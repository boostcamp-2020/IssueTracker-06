import React, { ChangeEvent, useState } from 'react';

import WriteFormWithProfile from '.';

export default {
  title: 'Organisms/WriteFormWithProfile',
  component: WriteFormWithProfile,
};

const PROFILE_URL =
  'https://avatars0.githubusercontent.com/u/37282087?s=40&amp;v=4';

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
    <WriteFormWithProfile
      profile={PROFILE_URL}
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

  return (
    <WriteFormWithProfile
      profile={PROFILE_URL}
      content={content}
      onChangeContent={onChangeContent}
    />
  );
};
