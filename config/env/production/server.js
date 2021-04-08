module.exports = ({ env }) => ({
  host: env('STRAPI_API_HOST', '0.0.0.0'),
  port: env.int('STRAPI_API_PORT', 1337),
  url: env("STRAPI_API_BACKEND_URL", "http://localhost"),
  proxy: true,
  cron: {
    enabled: false
  },
  admin: {
    url: env("STRAPI_ADMIN_URL", "/"),
    serveAdminPanel: false,
    auth: {
      secret: env('STRAPI_ADMIN_JWT_SECRET', 'bbc63056fa9b1d5f2582f643d2b38e12'),
    },
  },
});
