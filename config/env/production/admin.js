module.exports = ({ env }) => ({
  auth: {
    secret: env('STRAPI_ADMIN_JWT_SECRET', 'bbc63056fa9b1d5f2582f643d2b38e12'),
  },
  url: env("STRAPI_ADMIN_URL", "/"),
  serveAdminPanel: false,
});
