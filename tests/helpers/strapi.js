const Strapi = require('@strapi/strapi');
const http = require('http');

let instance;

async function setupStrapi() {
  if (!instance) {
    /** the following code in copied from `./node_modules/strapi/lib/Strapi.js` */
    await Strapi().load();

    instance = global.strapi; // strapi is global now

    await instance.server
      .use(instance.server.router.routes()) // populate KOA routes
      .use(instance.server.router.allowedMethods()); // populate KOA methods

    instance.server = http.createServer();
  }
  return instance;
}
module.exports = { setupStrapi };
