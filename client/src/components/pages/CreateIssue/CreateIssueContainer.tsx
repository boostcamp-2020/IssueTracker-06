import React, { FunctionComponent } from 'react';

import useChange from '@hooks/useChange';
import CreateIssuePresenter from './CreateIssuePresenter';

const CreateIssueContainer: FunctionComponent = () => {
  const [title, , onChangeTitle] = useChange<HTMLInputElement>('');
  const [content, , onChangeContent] = useChange<HTMLTextAreaElement>('');

  return (
    <CreateIssuePresenter
      title={title}
      onChangeTitle={onChangeTitle}
      content={content}
      onChangeContent={onChangeContent}
    />
  );
};

export default CreateIssueContainer;
