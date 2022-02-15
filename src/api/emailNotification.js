import { submitEmail } from "../../lib/notify/submitEmail";

async function handler(req, res) {
  // this route only accepts a POST method
  if (req.method === "POST") {
    let data = req.body;
    console.log(data)

    // attempt to send feedback email through notify
    try {
      const [status, json] = await submitEmail(
        {
          email: data.address,
        },
        {},
        process.env.NOTIFY_EMAIL_TEMPLATE_ID,
        data.address,
        process.env.NOTIFY_BASE_API_URL + "/v2/notifications/email",
        process.env.NOTIFY_API_KEY
      );

      // non okay status code return 500
      if (status >= 300) {
        return res.status(500).json({
          reason: "Notify",
          explanation:
            "Notify failed to send the validation email: " +
            JSON.stringify(json),
        });
      }
    } catch (e) {
      return res.status(500).json({
        reason: "Notify",
        explanation: e.message,
      });
    }

    res.status(201).end("NOTIFICATION EMAIL SENT");
  } else {
    res.setHeader("Allow", ["POST"]);
    res.status(405).end(`Method ${req.method} Not Allowed`);
  }
}

export default handler;