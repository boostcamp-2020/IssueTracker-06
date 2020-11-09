import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';
import LabelTag from '@components/atoms/LabelTag';
import Button from '@components/atoms/Button';
import PlainText from '@components/atoms/PlainText';

interface Props {
  title: string;
  bgColor: string;
  description?: string;
}

const StyledLabelCard = styled.div`
  display: flex;
  align-items: center;
  & > * {
    flex: 1;
  }

  & > div:last-child {
    text-align: right;
  }
`;

const LabelCard: FunctionComponent<Props> = ({
  title,
  bgColor,
  description = '',
}) => {
  return (
    <StyledLabelCard>
      <div>
        <LabelTag text={title} bgColor={bgColor} />
      </div>
      <div>
        <PlainText value={description} />
      </div>
      <div>
        <Button type="transparent">
          <PlainText value="Edit" />
        </Button>
        <PlainText value="Delete" />
      </div>
    </StyledLabelCard>
  );
};

export default LabelCard;
