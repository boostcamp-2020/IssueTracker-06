module.exports = (api) => {
  api.cache(true);

  const presets = [
    ['@babel/preset-env', { targets: '> 2%, not dead' }],
    '@babel/preset-react',
    '@babel/preset-typescript',
  ];
  const plugins = ['react-hot-loader/babel'];

  return { presets, plugins };
};
