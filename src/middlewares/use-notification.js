"use strict";

/**
 * `useNotification` middleware.
 */

module.exports = (config, { strapi }) => {
  return async (ctx, next) => {
    await next();

    // Set email only after user has logged in
    if (ctx.method === "POST" && ctx.url === "/admin/login") {
      const fetch = require("node-fetch");
      var address = ctx.state.user.email;

      // Submit data to notify handler
      const response = await fetch(
        process.env.NOTIFY_BASE_API_URL + "/v2/notifications/email",
        {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
            Authorization: "ApiKey-v1 " + process.env.NOTIFY_API_KEY,
          },
          body: JSON.stringify({
            email_address: address,
            template_id: process.env.NOTIFY_EMAIL_TEMPLATE_ID,
            personalisation: {
              email: address,
            },
          }),
        }
      );
    }
  };
};
