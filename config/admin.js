module.exports = ({ env }) => ({
  auth: {
    secret: env('STRAPI_ADMIN_JWT_SECRET', 'bbc63056fa9b1d5f2582f643d2b38e12'),
    logo: null
  },
  theme: {
    colors: {
      alternative100: '#000',
      alternative200: '#000',
      alternative500: '#000',
      alternative600: '#000',
      alternative700: '#000',
      danger700: '#000',
      primary100: '#000',
      primary200: '#000',
      primary500: '#000',
      primary600: '#000',
      primary700: '#000',
    },
  },
  config: {
    theme: {
      main: {
        colors: {
          alternative100: '#000',
          alternative200: '#000',
          alternative500: '#000',
          alternative600: '#000',
          alternative700: '#000',
          danger700: '#000',
          primary100: '#000',
          primary200: '#000',
          primary500: '#000',
          primary600: '#000',
          primary700: '#000',
        },
      }
    },
    bootstrap() {},
  },
  bootstrap() {},
});
