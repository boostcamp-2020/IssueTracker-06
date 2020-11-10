import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';
import LabelTag, { Label } from '@components/atoms/LabelTag';
import Button from '@components/atoms/Button';
import PlainText from '@components/atoms/PlainText';

interface Props {
  data: Label;
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

const LabelCard: FunctionComponent<Props> = ({ data }) => {
  return (
    <StyledLabelCard>
      <div>
        <LabelTag data={data} />
      </div>
      <div>
        <PlainText value={data.description || ''} />
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
