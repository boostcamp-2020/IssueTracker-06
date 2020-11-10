import React from 'react';
import { text } from '@storybook/addon-knobs';
import EmptyMessage from './EmptyMessage';

export default {
  component: EmptyMessage,
  title: 'Molecules/EmptyMessage',
};
export const Default = () => {
  const content = text('content', 'No results matched your search.');
  return <EmptyMessage content={content} />;
};
