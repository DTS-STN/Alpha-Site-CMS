module.exports = ({ env }) => {
  var storage = env("STRAPI_STORAGE", "local");
  if (storage === "azure") {
    return {
      "entity-notes": {
        enabled: true,
      },
      "user-permissions": {
        jwtSecret: env('STRAPI_ADMIN_JWT_SECRET', 'bbc63056fa9b1d5f2582f643d2b38e12'),
        jwt: {
          expiresIn: '8h',
        },
      },
      upload: {
        provider: "azure-storage",
        providerOptions: {
          account: env("STORAGE_ACCOUNT"),
          accountKey: env("STORAGE_ACCOUNT_KEY"),
          serviceBaseURL: env("STORAGE_URL"),
          containerName: env("STORAGE_CONTAINER_NAME"),
          defaultPath: "assets",
          maxConcurrent: 10,
        },
      },
    };
  }
};
