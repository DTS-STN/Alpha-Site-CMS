module.exports = ({ env }) => {
  const emailPlugin = {
    config: {
      provider: 'sendmail',
      settings: {
        defaultFrom: 'no-reply@servicecanada.gc.ca',
        defaultReplyTo: 'no-reply@servicecanada.gc.ca',
      },
    }
  }

  let storagePlugin = {}
  const storage = env("STRAPI_STORAGE", "local")
  if (storage === "azure") {
    storagePlugin = {
      provider: 'azure-storage',
      providerOptions: {
        account: env('STORAGE_ACCOUNT'),
        accountKey: env('STORAGE_ACCOUNT_KEY'),
        serviceBaseURL: env('STORAGE_URL'),
        containerName: env('STORAGE_CONTAINER_NAME'),
        defaultPath: 'assets',
        maxConcurrent: 10
      }
    }
  }

  return {
    upload: storagePlugin,
    email: emailPlugin
  }
};
