'use strict';

/**
 * `useNotification` middleware.
 */

module.exports = (config, { strapi }) => {
  // Add your own logic here.
  return async (ctx, next) => {
    strapi.log.info('In useNotification middleware.');

    await next();

    strapi.log.debug("This is a test", ctx.user.role)
  };
};
