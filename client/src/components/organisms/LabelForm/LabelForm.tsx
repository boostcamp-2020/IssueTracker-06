import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';
import Input from '@components/atoms/Input';
import InputLabel from '@components/atoms/InputLabel';
import Button from '@components/atoms/Button';
import BoldText from '@/components/atoms/BoldText';
import TextWithIcon from '@/components/molecules/TextWithIcon';
import { ChangeIcon } from '@components/atoms/icons';
import getTextColorByBGColor from '@lib/getTextColorByBGColor';

interface StyledProps {
  bgColor: string;
}

const StyledLabelForm = styled.form<StyledProps>`
  display: flex;
  align-items: center;
  & > * {
    flex: 1;
    padding-right: 16px;
  }

  & button {
    margin-right: 16px;
  }

  & > .color {
    & > div {
      display: flex;
    }
    & button {
      display: flex;
      align-items: center;
      padding: 5px;
      background-color: ${({ bgColor }) => bgColor};
    }
    & button svg {
      fill: ${({ bgColor }) => getTextColorByBGColor(bgColor)};
    }
  }

  & > .btn {
    text-align: right;
  }
`;

interface Props {
  title: string;
  description?: string;
  bgColor: string;
  onChangeTitle: (e: React.ChangeEvent<HTMLInputElement>) => void;
  onChangeDescription: (e: React.ChangeEvent<HTMLInputElement>) => void;
  onChangeColor: (e: React.ChangeEvent<HTMLInputElement>) => void;
  onClick: () => void;
}

const LabelForm: FunctionComponent<Props> = ({
  title,
  description = '',
  bgColor,
  onClick,
  onChangeTitle,
  onChangeDescription,
  onChangeColor,
}) => {
  return (
    <StyledLabelForm bgColor={bgColor}>
      <div>
        <InputLabel text="Label name" />
        <Input
          placeholder="Label name"
          value={title}
          onChange={onChangeTitle}
          type="text"
        />
      </div>
      <div>
        <InputLabel text="Description" />
        <Input
          placeholder="Descriptio (optional)"
          value={description}
          onChange={onChangeDescription}
          type="text"
        />
      </div>
      <div className="color">
        <InputLabel text="Color" />
        <div>
          <Button onClick={onClick}>
            <TextWithIcon icon={ChangeIcon} text="" />
          </Button>
          <Input value={bgColor} type="text" onChange={onChangeColor} />
        </div>
      </div>

      <div className="btn">
        <Button type="default">
          <BoldText value="Cancel" />
        </Button>
        <Button type="primary">
          <BoldText value="save changes" />
        </Button>
      </div>
    </StyledLabelForm>
  );
};

export default LabelForm;
