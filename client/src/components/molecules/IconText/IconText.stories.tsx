import React from 'react';
import { text } from '@storybook/addon-knobs';

import IconTag from '@components/atoms/Icons/IconTag';
import IconText from './index';

export default {
  title: 'IconText',
  component: IconText,
};

export const Default = () => {
  const content = text('content', 'default');

  return <IconText text={content} icon={IconTag} />;
};
