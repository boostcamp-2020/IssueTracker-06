import React, { FunctionComponent } from 'react';

import styled from '@themes/styled';
import AppLayout from '@components/organisms/AppLayout';
import SearchWithFilter from '@components/organisms/SearchWithFilter';
import LabelMilestoneToggle, {
  ToggleType,
} from '@components/molecules/LabelMilestoneToggle';
import Button from '@components/atoms/Button';
import BoldText from '@components/atoms/BoldText';
import IssueListFilterHeader from '@components/organisms/IssueListFilterHeader';
import IssueCard from '@components/organisms/IssueCard';
import { Issue } from '@stores/type';
import { Link } from 'react-router-dom';

interface Props {
  inputSearchFilter: string;
  onChangeInputSearchFilter: (e: React.ChangeEvent<HTMLInputElement>) => void;
  onCheckIssue: (id: number) => void;
  onClickLabelMilestoneToggle: (clickedToggle: ToggleType) => void;
  onCheckIssueListHeader: (isChecked: boolean) => void;
  labelCount: number;
  milestoneCount: number;
  issues: Issue[];
  checkedIssues: number[];
}

const StyledMainSection = styled.section`
  max-width: 1200px;
  margin: 30px auto;

  & > nav {
    display: flex;
    justify-content: space-between;
    margin-bottom: 20px;

    & > form {
      flex-grow: 1;
    }

    & > nav {
      margin: 0 14px;
    }
  }
`;

const MainPresenter: FunctionComponent<Props> = ({
  inputSearchFilter,
  onChangeInputSearchFilter,
  onClickLabelMilestoneToggle,
  onCheckIssue,
  onCheckIssueListHeader,
  labelCount,
  milestoneCount,
  issues,
  checkedIssues,
}) => (
  <AppLayout>
    <StyledMainSection>
      <nav>
        <SearchWithFilter
          value={inputSearchFilter}
          onChange={onChangeInputSearchFilter}
        />
        <LabelMilestoneToggle
          onClickToggle={onClickLabelMilestoneToggle}
          labelCount={labelCount}
          milestoneCount={milestoneCount}
        />
        <Link to="/issue/new">
          <Button type="primary">
            <BoldText value="New issue" />
          </Button>
        </Link>
      </nav>
      <section>
        <IssueListFilterHeader
          checkedCount={checkedIssues.length}
          onCheckIssueListHeader={onCheckIssueListHeader}
        />
        <ul>
          {issues.map(
            (issue) =>
              issue.is_open === 1 && (
                <IssueCard
                  key={`mainpage_${issue.id}`}
                  isOpen={issue.is_open}
                  title={issue.title}
                  labels={issue.Labels}
                  issueNum={issue.id}
                  time="2020-10-10"
                  author={issue.User.name}
                  milestone={issue.Milestone?.name}
                  assignees={issue.Assignee}
                  onCheck={onCheckIssue}
                  isChecked={checkedIssues.includes(issue.id)}
                />
              ),
          )}
        </ul>
      </section>
    </StyledMainSection>
  </AppLayout>
);

export default MainPresenter;
