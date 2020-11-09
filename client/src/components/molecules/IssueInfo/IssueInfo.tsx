import React, { FunctionComponent } from 'react';
import LabelTag from '@components/atoms/LabelTag';
import styled from '@themes/styled';
import IconMilestone from '@components/atoms/icons/IconMilestone';
import TextWithIcon from '../TextWithIcon';

interface Props {
  isOpen: boolean;
  title: string;
  label?: string;
  labelBg?: string;
  issueNum: number;
  time: string;
  author: string;
  milestone?: string;
}

const StyledIssueInfo = styled.div`
  display: flex;
  flex-direction: column;
  margin: 8px;
  width: 70%;
  & > .issueTitleContainer {
    display: flex;
    align-items: center;
    & > h1 {
      all: unset;
      font-size: 1rem;
      font-weight: 600;
      margin-right: 0.2rem;
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
  label,
  labelBg,
  issueNum,
  time,
  author,
  milestone,
}) => (
  <StyledIssueInfo>
    <div className="issueTitleContainer">
      <h1>{title} </h1>
      <LabelTag text={label} bgColor={labelBg} />
    </div>
    <div className="issueDescriptionContainer">
      {isOpen ? (
        <>
          <span>#{issueNum} </span>
          <span>&nbsp;opened {time} </span>
          <span>&nbsp;by {author}</span>
          <TextWithIcon icon={IconMilestone} text={milestone} />
        </>
      ) : (
        <>
          <span>#{issueNum}</span>
          <span>&nbsp;by {author}</span>
          <span>&nbsp;was closed {time}</span>
          <TextWithIcon icon={IconMilestone} text={milestone} />
        </>
      )}
    </div>
  </StyledIssueInfo>
);

export default IssueInfo;
