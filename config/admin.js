module.exports = ({ env }) => ({
  auth: {
    secret: env('STRAPI_ADMIN_JWT_SECRET'),
    options: {
      expiresIn: "8h",
    },
  },
  apiToken: {
    salt: env("STRAPI_ADMIN_JWT_SECRET")
  }
});
