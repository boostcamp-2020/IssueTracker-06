import React, { FunctionComponent } from 'react';
import IssueInfo from '@components/molecules/IssueInfo';
import { IssueOpenedIcon, IssueClosedIcon } from '@components/atoms/icons';
import styled from '@themes/styled';
import Assignees from '@components/molecules/Assignees';
import { User } from '@stores/type';
import { Label } from '@components/atoms/LabelTag';

interface Props {
  isOpen: 1 | 0;
  title: string;
  labels?: Label[];
  issueNum: number;
  time: string;
  author: string;
  milestone?: string;
  assignees?: User[];
  onCheck: (id: number) => void;
  isChecked: boolean;
}

const StyledIssueCard = styled.li`
  display: flex;
  box-sizing: border-box;
  border: 1px solid ${({ theme }) => theme.palette.BORDER_COLOR};
  border-top: none;
  padding: 4px 0;
  cursor: pointer;

  & > input {
    margin: 11px 0px 8px 16px;
  }

  &:hover {
    background-color: ${({ theme }) => theme.palette.BG_COLOR02};
  }
`;

const IssueCard: FunctionComponent<Props> = ({
  isOpen,
  title,
  labels,
  issueNum,
  time,
  author,
  milestone,
  assignees,
  onCheck,
  isChecked,
}) => (
  <StyledIssueCard>
    <input
      type="checkbox"
      onChange={() => onCheck(issueNum)}
      checked={isChecked}
    />
    {isOpen ? <IssueOpenedIcon /> : <IssueClosedIcon />}
    <IssueInfo
      isOpen={isOpen}
      title={title}
      labels={labels}
      issueNum={issueNum}
      time={time}
      author={author}
      milestone={milestone}
    />
    <Assignees users={assignees} />
  </StyledIssueCard>
);

export default IssueCard;
