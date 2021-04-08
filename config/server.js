module.exports = ({ env }) => ({
  host: env('HOST', '0.0.0.0'),
  port: env.int('PORT', 1337),
  admin: {
    auth: {
      secret: env('STRAPI_ADMIN_JWT_SECRET', 'bbc63056fa9b1d5f2582f643d2b38e12'),
    },
  },
});
