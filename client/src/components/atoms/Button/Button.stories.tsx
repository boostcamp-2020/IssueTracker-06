import React from 'react';
import { text } from '@storybook/addon-knobs';

import IconTag from '@components/atoms/Icons/IconTag';
import IconText from '@components/molecules/IconText';
import Button, { ButtonType } from './index';

export default {
  title: 'Button',
  component: Button,
};

export const Default = () => {
  const content = text('text', 'default');
  const disabled = text('disable', '');

  return (
    <Button disabled={!!disabled}>
      <IconText icon={IconTag} text={content} />
    </Button>
  );
};

export const Error = () => {
  const content = text('text', 'default');
  const disabled = text('disable', '');

  return (
    <Button type="error" disabled={!!disabled}>
      <IconText icon={IconTag} text={content} />
    </Button>
  );
};

export const Primary = () => {
  const content = text('text', 'default');
  const disabled = text('disable', '');

  return (
    <Button type="primary" disabled={!!disabled}>
      <IconText icon={IconTag} text={content} />
    </Button>
  );
};

export const transparent = () => {
  const content = text('text', 'default');
  const disabled = text('disable', '');

  return (
    <Button type="transparent" disabled={!!disabled}>
      <IconText icon={IconTag} text={content} />
    </Button>
  );
};
