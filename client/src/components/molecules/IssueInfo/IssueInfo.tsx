import React, { FunctionComponent } from 'react';
import { Link } from 'react-router-dom';

import LabelTag, { Label } from '@components/atoms/LabelTag';
import styled from '@themes/styled';
import { MilestoneIcon } from '@/components/atoms/icons';
import TextWithIcon from '../TextWithIcon';

interface Props {
  isOpen: 1 | 0;
  title: string;
  labels?: Label[];
  issueNum: number;
  time: string;
  author: string;
  milestone?: string;
}

const StyledIssueInfo = styled.div`
  display: flex;
  flex-direction: column;
  margin: 8px;
  flex-grow: 1;

  & > .issueTitleContainer {
    display: flex;
    align-items: center;

    & > a > h1 {
      all: unset;
      font-size: 1rem;
      font-weight: 600;
      margin-right: 0.2rem;

      &:hover {
        color: ${({ theme }) => theme.palette.LINK_BLUE};
      }
    }
    & > span {
      margin-right: 6px;
    }
  }

  & > .issueDescriptionContainer {
    display: flex;
    align-items: center;
    margin-top: 4px;
    & > span {
      display: inline-flex;
      color: ${({ theme }) => theme.palette.SECONDARY};
      font-size: 0.8rem;
      margin-right: 0.2rem;
      & > svg {
        margin: 0 3px 0 6px;
      }
      & > span {
        font-size: 0.8rem;
      }
    }
  }
`;

const IssueInfo: FunctionComponent<Props> = ({
  isOpen,
  title,
  labels,
  issueNum,
  time,
  author,
  milestone,
}) => (
  <StyledIssueInfo>
    <div className="issueTitleContainer">
      <Link to={`/issue/${issueNum}`}>
        <h1>{title}</h1>
      </Link>
      {labels?.map((label) => (
        <LabelTag key={label.id} data={label} />
      ))}
    </div>
    <div className="issueDescriptionContainer">
      {isOpen ? (
        <>
          <span>{`#${issueNum}`}</span>
          <span>{`opened ${time}`}</span>
          <span>{`by ${author}`}</span>
        </>
      ) : (
        <>
          <span>{`#${issueNum}`}</span>
          <span>{`by ${author}`}</span>
          <span>{`was closed ${time}`}</span>
        </>
      )}
      {milestone && <TextWithIcon icon={MilestoneIcon} text={milestone} />}
    </div>
  </StyledIssueInfo>
);

export default IssueInfo;
