// path: ./config/middlewares.js

module.exports = [
  "strapi::errors",
  "strapi::security",
  "strapi::cors",
  "strapi::poweredBy",
  "strapi::logger",
  "strapi::query",
  "strapi::body",
  "strapi::favicon",
  "strapi::public",
  {
    name: "global::use-notification",
    config: {
      cors: {
        origin: [
          "http://localhost:1337/",
          "https://alphasite-admin.dts-stn.com",
        ],
        headers: ["*"],
      },
    },
  },
];
