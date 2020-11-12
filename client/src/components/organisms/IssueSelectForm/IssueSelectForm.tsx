import React, {
  FunctionComponent,
  useCallback,
  useContext,
  useState,
} from 'react';

import styled from '@themes/styled';
import Button from '@components/atoms/Button';
import { SettingIcon } from '@components/atoms/icons';
import LabelTag from '@components/atoms/LabelTag';
import SelectMenuModal from '@components/molecules/SelectMenuModal';
import SelectMenuItemLabel from '@components/molecules/SelectMenuModal/SelectMenuItem/SelectMenuItemLabel';
import SelectMenuItemMilestone from '@components/molecules/SelectMenuModal/SelectMenuItem/SelectMenuItemMilestone';
import Title from '@components/atoms/selectMenuItem/Title';

import labelContext from '@stores/label';
import milestoneContext from '@stores/milestone';
import { Label, User, Milestone } from '@stores/type';
import useChange from '@hooks/useChange';

interface Props {
  title: string;
  emptyMessage?: string;
  onSelect: <T extends User | Label | Milestone>(selected: T) => void;
  optionHeader: string;
  selectedItems?: (User | Label | Milestone)[];
}

const StyledIssueSelectForm = styled.div`
  color: ${({ theme }) => theme.palette.SECONDARY};
  position: relative;
  & > button {
    height: 30px;
    width: 100%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0;
    margin: 8px 0;
    color: currentColor;

    & > span {
      font-weight: 600;
    }

    & > svg {
      position: relative;
      width: 16px;
      fill: currentColor;
    }

    &:hover {
      color: ${({ theme }) => theme.palette.LINK_BLUE};
    }
  }

  & span {
    font-size: 0.8rem;
  }

  & .label {
    margin: 0.1rem;
  }

  & > hr {
    width: 100%;
    border: 0.5px solid ${({ theme }) => theme.palette.BG_COLOR03};
    margin-top: 16px;
  }
`;

const IssueSelectForm: FunctionComponent<Props> = ({
  title,
  emptyMessage = '',
  onSelect,
  optionHeader,
  selectedItems,
}) => {
  const [isOptionOpened, setIsOptionOpened] = useState(false);
  const [value, , onChangeValue] = useChange<HTMLInputElement>('');
  const { labels } = useContext(labelContext);
  const { milestones } = useContext(milestoneContext);

  const onClick = useCallback(() => {
    setIsOptionOpened(!isOptionOpened);
  }, [isOptionOpened]);

  const setOptions = () => {
    switch (title) {
      case 'Labels': {
        return labels.map((label) => {
          return (
            <SelectMenuItemLabel
              key={label.id}
              swatchColor={label.color}
              title={label.name}
              description={label.description}
              onClick={() => onSelect(label)}
              isClicked={selectedItems?.includes(label)}
            />
          );
        });
      }
      case 'Milestone': {
        return milestones.map((milestone) => (
          <SelectMenuItemMilestone
            key={milestone.id}
            title={milestone.name}
            description={milestone.description}
            onClick={() => onSelect(milestone)}
            isClicked={selectedItems?.includes(milestone)}
          />
        ));
      }
      default:
        return null;
    }
  };

  const options = setOptions();

  const showClicked = (clickedItems: any) => {
    console.log(clickedItems);
    switch (title) {
      case 'Labels': {
        return clickedItems.map((item: Label) => (
          <LabelTag key={item.id} data={item} />
        ));
      }
      case 'Milestone': {
        return clickedItems.map((item: Milestone) => (
          <Title key={item.id} text={item.name} />
        ));
      }
      default:
        return null;
    }
  };

  return (
    <StyledIssueSelectForm>
      <Button type="transparent" onClick={onClick}>
        <>
          <span>{title}</span>
          <SettingIcon />
        </>
      </Button>
      {isOptionOpened && (
        <SelectMenuModal
          optionHeader={optionHeader}
          inputValue={value}
          onChange={onChangeValue}
        >
          {options || <></>}
        </SelectMenuModal>
      )}
      {selectedItems?.length ? (
        showClicked(selectedItems)
      ) : (
        <span>{emptyMessage}</span>
      )}

      <hr />
    </StyledIssueSelectForm>
  );
};

export default IssueSelectForm;
