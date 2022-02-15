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

      //Test hitting feedback api
      var feedbackToSend = {
        project: "test",
        pageUrl: "test",
        feedback: "test",
      };
      console.log(address);
      console.log(feedbackToSend);

      // Submit data to notify handler
      const response = await fetch(
        "https://alphasite.dts-stn.com/api/feedback",
        {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(feedbackToSend),
        }
      );

      console.log(response.status)

      // Output email status to console
      if (response.status === 201 || response.status === 200) {
        console.log("Email sent");
      } else {
        console.log("Email not sent");
      }
    }
  };
};
