import React, { FunctionComponent } from 'react';
import IssueInfo from '@components/molecules/IssueInfo';
import { IssueOpened, IssueClosed } from '@components/atoms/icons';
import styled from '@themes/styled';
import Assignees, { User } from '@components/molecules/Assignees';

interface Props {
  isOpen: boolean;
  title: string;
  label?: string;
  labelBg?: string;
  issueNum: number;
  time: string;
  author: string;
  milestone?: string;
  assignees?: User[];
}

const StyledIssueCard = styled.div`
  display: flex;
  box-sizing: border-box;
  & > input {
    margin: 11px 0px 8px 16px;
  }
`;

const IssueCard: FunctionComponent<Props> = ({
  isOpen,
  title,
  label,
  labelBg,
  issueNum,
  time,
  author,
  milestone,
  assignees,
}) => (
  <StyledIssueCard>
    <input type="checkbox" />
    {isOpen ? <IssueOpened /> : <IssueClosed />}
    <IssueInfo
      isOpen={isOpen}
      title={title}
      label={label}
      labelBg={labelBg}
      issueNum={issueNum}
      time={time}
      author={author}
      milestone={milestone}
    />
    <Assignees users={assignees} />
  </StyledIssueCard>
);

export default IssueCard;
