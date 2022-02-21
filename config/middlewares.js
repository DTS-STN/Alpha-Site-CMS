// path: ./config/middlewares.js

module.exports = [
  "strapi::errors",
  "strapi::security",
  "strapi::poweredBy",
  "strapi::logger",
  "strapi::query",
  "strapi::body",
  "strapi::favicon",
  "strapi::public",
  "global::use-notification",
  {
    name: "strapi::cors",
    config: {
      enabled: true,
      headers: ["*"],
      origin: ["https://alphasite-admin.dts-stn.com/", "http://localhost:1337"],
    },
  },
];
