module.exports = {
  parser: '@typescript-eslint/parser',
  plugins: ['@typescript-eslint'],
  extends: ['airbnb-base', 'plugin:prettier/recommended'],
  rules: {
    'linebreak-style': 0,
    'import/no-unresolved': 0,
    'import/extensions': 0,
    'consistent-return': 0,
    'prettier/prettier': 0,
    'no-unused-vars': 1,
  },
};
