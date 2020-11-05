import React from 'react';
import { text } from '@storybook/addon-knobs';
import { Warning } from '@components/atoms/icons';
import EmptyMessage from './EmptyMessage';

export default {
  component: EmptyMessage,
  title: 'Molecules/EmptyMessage',
};
export const Default = () => {
  const content = text('content', 'No results matched your search.');
  const Icon = Warning;
  return <EmptyMessage Icon={Icon} content={content} />;
};
