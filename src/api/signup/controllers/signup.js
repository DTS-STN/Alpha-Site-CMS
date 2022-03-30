'use strict';

/**
 *  signup controller
 */

const { createCoreController } = require('@strapi/strapi').factories;

module.exports = createCoreController('api::signup.signup');
