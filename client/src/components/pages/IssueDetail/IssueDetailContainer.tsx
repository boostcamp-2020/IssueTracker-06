import React, { FunctionComponent, useEffect, useState } from 'react';
import { match } from 'react-router-dom';
import getIssue from '@apis/getIssue';
import { convertSelectedIssue } from '@lib/convertType';
import useChange from '@hooks/useChange';
import useDisplay from '@hooks/useDisplay';
import IssueDetailPresenter from './IssueDetailPresenter';

interface DetailParams {
  id: string;
}

interface DetailProps {
  match: match<DetailParams>;
}

const IssueDetailContainer: FunctionComponent<DetailProps> = ({
  match: propsMatch,
}) => {
  const user = {
    id: 1,
    name: 'etst',
    email: 'test@test.st',
    profile:
      'https://avatars2.githubusercontent.com/u/27042086?s=460&u=43811708e806ff1318b7369225fe7b275375e5e2&v=4',
  };

  const [issue, setIssue] = useState<any>(null);
  const [issueTitle, setTitle, onChangeIssueTitle] = useChange<
    HTMLInputElement
  >('');
  const [issueContent, setContent, onChangeIssueContent] = useChange<
    HTMLTextAreaElement
  >('');
  const [titleEdit, , onClickTitleEdit] = useDisplay();
  const [contentEdit, , onClickContentEdit] = useDisplay();
  const [commentContent, , onChangeComment] = useChange<HTMLTextAreaElement>(
    '',
  );

  useEffect(() => {
    (async () => {
      const issueId = parseInt(propsMatch.params.id, 10);
      const result = await getIssue(issueId);
      const convertIssue = convertSelectedIssue(result.issue);
      setIssue(convertIssue);
      setTitle(convertIssue.title);
      setContent(convertIssue.content);
    })();
  }, []);

  return issue ? (
    <IssueDetailPresenter
      user={user}
      issue={issue}
      titleEdit={titleEdit}
      onClickTitleEdit={onClickTitleEdit}
      commentContent={commentContent}
      onChangeComment={onChangeComment}
      issueContent={issueContent}
      onChangeIssueContent={onChangeIssueContent}
      issueTitle={issueTitle}
      onChangeIssueTitle={onChangeIssueTitle}
      contentEdit={contentEdit}
      onClickContentEdit={onClickContentEdit}
    />
  ) : (
    <></>
  );
};

export default IssueDetailContainer;
