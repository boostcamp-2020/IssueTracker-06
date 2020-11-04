const path = require('path');

module.exports = {
  stories: ['../src/**/*.stories.mdx', '../src/**/*.stories.@(js|jsx|ts|tsx)'],
  addons: [
    '@storybook/addon-links',
    '@storybook/addon-essentials',
    '@storybook/addon-actions',
    '@storybook/addon-knobs',
  ],
  webpackFinal: async (config, { configType }) => {
    config.resolve.alias = {
      ...config.resolve.alias,
      '@': path.resolve(__dirname, '../src'),
      '@components': path.resolve(__dirname, '../src/components'),
      '@lib': path.resolve(__dirname, '../src/lib'),
      '@apis': path.resolve(__dirname, '../src/apis'),
      '@themes': path.resolve(__dirname, '../src/themes'),
      '@stores': path.resolve(__dirname, '../src/stores'),
      '@hooks': path.resolve(__dirname, '../src/hooks'),
    };
    return config;
  },
};
