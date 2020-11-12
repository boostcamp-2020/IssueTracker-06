import React, { FunctionComponent } from 'react';
import BoldText from '@components/atoms/BoldText';
import PlainText from '@components/atoms/PlainText';
import Button from '@components/atoms/Button';
import styled from '@themes/styled';

interface Props {
  name: string;
  content: string;
  myContent?: boolean;
  myComment?: boolean;
  onClick?: () => void;
}

interface StyledProps {
  myContent?: boolean;
  myComment?: boolean;
}

const StyledIssueContent = styled.div<StyledProps>`
  position: relative;
  border-radius: 0.5rem;
  border: 1px solid ${({ theme }) => theme.palette.BORDER_COLOR};

  .content-header {
    display: flex;
    align-items: center;
    padding: 8px 16px;
    background-color: ${({ theme, myContent, myComment }) => {
      if (myContent || myComment) return theme.palette.LIGHT_BLUE01;
      return theme.palette.BG_COLOR02;
    }};
    border-bottom: 1px solid ${({ theme }) => theme.palette.BORDER_COLOR};
    border-radius: 0.5rem 0.5rem 0 0;
    width: 100%;
    box-sizing: border-box;

    .header-title {
      flex-grow: 1;
    }

    span {
      margin-right: 8px;
    }
  }
  .content {
    padding: 15px;
    box-sizing: border-box;
  }

  &::before {
    position: absolute;
    top: 14px;
    left: -7px;
    width: 12px;
    height: 12px;
    content: '';
    border-bottom: 1px solid ${({ theme }) => theme.palette.BORDER_COLOR};
    border-left: 1px solid ${({ theme }) => theme.palette.BORDER_COLOR};
    border-width: 1px;
    transform: rotate(45deg);
    background-color: ${({ theme }) => theme.palette.BG_COLOR02};
  }
`;

const IssueContent: FunctionComponent<Props> = ({
  name,
  content,
  myContent = false,
  myComment = false,
  onClick,
}) => (
  <StyledIssueContent myContent={myContent} myComment={myComment}>
    <div className="content-header">
      <div className="header-title">
        <BoldText value={name} />
        <PlainText value="commented" />
      </div>
      {myContent && (
        <div className="edit-btn">
          <Button type="transparent" onClick={onClick}>
            <PlainText value="edit" />
          </Button>
        </div>
      )}
    </div>

    <div>
      <div className="content">{content}</div>
    </div>
  </StyledIssueContent>
);

export default IssueContent;
