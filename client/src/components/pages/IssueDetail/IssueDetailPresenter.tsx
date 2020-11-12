import React, { FunctionComponent } from 'react';
import AppLayout from '@components/organisms/AppLayout';
import { Issue } from '@stores/type';
import styled from '@themes/styled';
import Button from '@components/atoms/Button';
import BoldText from '@components/atoms/BoldText';
import PlainText from '@components/atoms/PlainText';
import TextWithIcon from '@components/molecules/TextWithIcon';
import WriteFormWithProfile from '@components/organisms/WriteFormWithProfile';
import ContentWithProfile from '@components/organisms/ContentWithProfile';
import Input from '@components/atoms/Input';
import { IssueOpenedIcon, IssueClosedIcon } from '@components/atoms/icons';
import SelectForm from '@components/pages/SelectForm';

interface Props {
  user?: any;
  issue: Issue;
  commentContent: string;
  onChangeComment: (e: React.ChangeEvent<HTMLTextAreaElement>) => void;
  issueContent: string;
  onChangeIssueContent: (e: React.ChangeEvent<HTMLTextAreaElement>) => void;
  titleEdit: boolean;
  onClickTitleEdit: () => void;
  issueTitle: string;
  onChangeIssueTitle: (e: React.ChangeEvent<HTMLInputElement>) => void;
  contentEdit: boolean;
  onClickContentEdit: () => void;
}

const StyledContainer = styled.div`
  padding: 32px;

  .main-content {
    width: 100%;
    display: flex;
    flex-direction: row;
  }

  .issue-contents {
    flex-grow: 1;
  }

  .issue-contents > div {
    margin: 16px;
  }

  .issue-contents > div:last-child {
    padding: 16px 0;
    border-top: 2px solid ${({ theme }) => theme.palette.BORDER_COLOR};
  }
`;

const StyledTitle = styled.div`
  display: flex;

  form {
    display: flex;
    align-items: center;
    margin-bottom: 8px;
    width: 100%;
    input {
      flex-grow: 1;
      margin-right: 8px;
    }
    .save-cancel-btn {
      display: flex;
      align-items: center;
    }
  }

  & > div {
    display: flex;
    margin-bottom: 8px;
    align-items: center;
    width: 100%;

    .title-container {
      flex-grow: 1;
    }

    .edit-btn span {
      font-size: 1rem;
    }

    span {
      font-size: 2rem;
      font-weight: 400;
    }

    .title {
      color: ${({ theme }) => theme.palette.PRIMARY};
      margin-right: 5px;
    }

    .title-no {
      color: ${({ theme }) => theme.palette.SECONDARY};
    }
  }
`;

const StyledSubTitle = styled.div`
  display: flex;
  align-items: center;
  padding-bottom: 16px;
  margin-bottom: 20px;
  border-bottom: 1px solid ${({ theme }) => theme.palette.BG_COLOR04};

  .opened {
    background-color: ${({ theme }) => theme.palette.BTN_GREEN};
  }
  .closed {
    background-color: ${({ theme }) => theme.palette.BTN_RED};
  }

  .opened,
  .closed {
    padding: 8px 12px;
    border-radius: 1rem;
    margin-right: 8px;
    svg,
    span {
      fill: ${({ theme }) => theme.palette.LIGHT};
      color: ${({ theme }) => theme.palette.LIGHT};
      font-weight: 500;
    }

    .issue-info > span {
      color: ${({ theme }) => theme.palette.SECONDARY} !important;
      margin-right: 0.5rem !important;
    }
  }
`;

const IssueDetailPresenter: FunctionComponent<Props> = ({
  user,
  issue,
  commentContent,
  onChangeComment,
  issueContent,
  onChangeIssueContent,
  titleEdit,
  onClickTitleEdit,
  issueTitle,
  onChangeIssueTitle,
  contentEdit,
  onClickContentEdit,
}) => {
  return (
    <>
      <AppLayout>
        <StyledContainer>
          <StyledTitle>
            {titleEdit ? (
              <form>
                <Input
                  value={issueTitle}
                  type="text"
                  onChange={onChangeIssueTitle}
                />
                <div className="save-cancel-btn">
                  <Button type="default">
                    <BoldText value="Save" />
                  </Button>
                  <Button type="transparent" onClick={onClickTitleEdit}>
                    <PlainText value="Cancel" />
                  </Button>
                </div>
              </form>
            ) : (
              <div>
                <div className="title-container">
                  <span className="title">{issue.title}</span>
                  <span className="title-no">{`#${issue.id}`}</span>
                </div>
                {user.id === issue.User.id && (
                  <div className="edit-btn">
                    <Button type="default" onClick={onClickTitleEdit}>
                      <BoldText value="Edit" />
                    </Button>
                  </div>
                )}
              </div>
            )}
          </StyledTitle>
          <div>
            {issue.is_open ? (
              <StyledSubTitle>
                <TextWithIcon
                  icon={IssueOpenedIcon}
                  text="Opened"
                  className="opened"
                />
                <div className="issue-info">
                  <BoldText value={issue.User.id.toString()} />
                  <PlainText value="opened this issue" />
                  <PlainText value={` · ${issue.Comments.length} comments`} />
                </div>
              </StyledSubTitle>
            ) : (
              <StyledSubTitle>
                <TextWithIcon
                  icon={IssueClosedIcon}
                  text="Closed"
                  className="closed"
                />
                <div className="issue-info">
                  <BoldText value={issue.User.id.toString()} />
                  <PlainText value="closed this issue" />
                </div>
              </StyledSubTitle>
            )}
          </div>
          <div className="main-content">
            <div className="issue-contents">
              {!contentEdit ? (
                <ContentWithProfile
                  myContent={issue.User.id === user.id}
                  profile={issue.User.profile}
                  name={issue.User.name}
                  content={issue.content}
                  onClick={onClickContentEdit}
                />
              ) : (
                <WriteFormWithProfile
                  profile={user.profile}
                  content={issueContent}
                  onChangeContent={onChangeIssueContent}
                />
              )}
              {issue.Comments.map((comment: any) => (
                <ContentWithProfile
                  key={comment.id}
                  myComment={comment.User.id === user.id}
                  profile={comment.User.profile}
                  name={comment.User.name}
                  content={comment.content}
                />
              ))}
              <WriteFormWithProfile
                profile={user.profile}
                content={commentContent}
                onChangeContent={onChangeComment}
              />
            </div>
            <div>
              <SelectForm />
            </div>
          </div>
        </StyledContainer>
      </AppLayout>
    </>
  );
};

export default IssueDetailPresenter;
