import React from 'react';
import { text } from '@storybook/addon-knobs';

import IssueSelectForm from '.';

export default {
  component: IssueSelectForm,
  title: 'Organisms/IssueSelectForm',
};

export const Default = () => {
  const title = text('title', 'title');
  const emptyMessage = text('emptyMessage', 'None yet');
  const optionHeader = text(
    'optionHeader',
    'Assign up to 10 people to this issue',
  );

  return (
    <IssueSelectForm
      title={title}
      emptyMessage={emptyMessage}
      optionHeader={optionHeader}
    />
  );
};
