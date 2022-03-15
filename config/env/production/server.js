module.exports = ({ env }) => ({
  host: env('STRAPI_API_HOST', '0.0.0.0'),
  port: env.int('STRAPI_API_PORT', 1337),
  proxy: true,
  cron: {
    enabled: false
  },
  app: {
    keys: ["myKey1"]
  }
});
