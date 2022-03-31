'use strict';

/**
 * signup service.
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::signup.signup');
