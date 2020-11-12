import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';

import TextWithIcon from '@components/molecules/TextWithIcon';
import { TagIcon, MilestoneIcon } from '@/components/atoms/icons';
import { ToggleType } from '.';

interface Props {
  focus?: ToggleType;
  onClickToggle: (clickedToggle: ToggleType) => void;
  labelCount?: number;
  milestoneCount?: number;
}

const StyledLabelMilestoneToggle = styled.nav`
  display: flex;
  width: fit-content;
  border: 1px solid ${({ theme }) => theme.palette.BORDER_COLOR};
  border-radius: 6px;
  overflow: hidden;
  cursor: pointer;

  & > span {
    padding: 8px 16px;
    transition: background 0.5s;

    &:first-child {
      border-right: 1px solid ${({ theme }) => theme.palette.BORDER_COLOR};
    }

    &.focus {
      background-color: ${({ theme }) => theme.palette.LINK_BLUE};
      color: ${({ theme }) => theme.palette.LIGHT};
    }

    &:not(.focus):hover {
      background-color: ${({ theme }) => theme.palette.BG_COLOR02};
    }
  }
`;

const LabelMilestoneToggle: FunctionComponent<Props> = ({
  focus,
  onClickToggle,
  labelCount,
  milestoneCount,
}) => (
  <StyledLabelMilestoneToggle>
    <TextWithIcon
      icon={TagIcon}
      text="Labels"
      onClick={() => onClickToggle('label')}
      className={focus === 'label' ? 'focus' : ''}
      count={labelCount}
    />
    <TextWithIcon
      icon={MilestoneIcon}
      text="Milestones"
      onClick={() => onClickToggle('milestone')}
      className={focus === 'milestone' ? 'focus' : ''}
      count={milestoneCount}
    />
  </StyledLabelMilestoneToggle>
);

export default LabelMilestoneToggle;
