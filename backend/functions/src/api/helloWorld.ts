import { logger } from "firebase-functions";
import { onRequest } from "firebase-functions/v2/https";

export const helloWorld = onRequest((req, res) => {
  logger.info("Hello, logs!");
  res.send("Hello from Centero! (This endpoint is for testing purposes only 🙏)");
});