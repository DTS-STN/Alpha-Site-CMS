module.exports = ({ env }) => ({
  host: env('STRAPI_API_HOST', '0.0.0.0'),
  port: env.int('STRAPI_API_PORT', 1337),
  url: env("STRAPI_API_BACKEND_URL", "http://localhost"),
  proxy: true,
  cron: {
    enabled: false
  },
});
