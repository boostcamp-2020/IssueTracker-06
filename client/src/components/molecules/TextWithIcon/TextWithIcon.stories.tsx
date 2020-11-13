import React from 'react';
import { text } from '@storybook/addon-knobs';

import { TagIcon } from '@/components/atoms/icons';
import TextWithIcon from './index';

export default {
  title: 'Molecules/TextWithIcon',
  component: TextWithIcon,
};

export const Left = () => {
  const content = text('content', 'default');

  return <TextWithIcon text={content} icon={TagIcon} />;
};

export const Right = () => {
  const content = text('content', 'default');

  return <TextWithIcon text={content} icon={TagIcon} align="right" />;
};
