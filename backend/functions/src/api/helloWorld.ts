import { logger } from "../environment";

import { onRequest } from "firebase-functions/v2/https";

/**
 * Respond with "hello world" from specified endpoint.
 */
export const helloWorld = onRequest((req, res) => {
  logger.info("Hello, logs!");
  res.send("Hello from Centero! (This endpoint is for testing purposes only 🙏)");
});