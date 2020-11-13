import React from 'react';

import useChange from '@hooks/useChange';

import WriteFormWithProfile from '.';

export default {
  title: 'Organisms/WriteFormWithProfile',
  component: WriteFormWithProfile,
};

const PROFILE_URL =
  'https://avatars0.githubusercontent.com/u/37282087?s=40&amp;v=4';

export const Default = () => {
  const [title, , onChangeTitle] = useChange<HTMLInputElement>('');
  const [content, , onChangeContent] = useChange<HTMLTextAreaElement>('');

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
  const [content, , onChangeContent] = useChange<HTMLTextAreaElement>('');

  return (
    <WriteFormWithProfile
      profile={PROFILE_URL}
      content={content}
      onChangeContent={onChangeContent}
    />
  );
};
