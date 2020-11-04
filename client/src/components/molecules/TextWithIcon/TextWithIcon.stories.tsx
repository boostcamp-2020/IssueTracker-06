import React from 'react';
import { text } from '@storybook/addon-knobs';

import IconTag from '@/components/atoms/icons/IconTag';
import TextWithIcon from './index';

export default {
  title: 'TextWithIcon',
  component: TextWithIcon,
};

export const Left = () => {
  const content = text('content', 'default');

  return <TextWithIcon text={content} icon={IconTag} />;
};

export const Right = () => {
  const content = text('content', 'default');

  return <TextWithIcon text={content} icon={IconTag} align="right" />;
};
