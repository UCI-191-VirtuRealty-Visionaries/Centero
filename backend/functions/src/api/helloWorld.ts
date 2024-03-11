import { logger } from "../environment";
import { onCall } from "firebase-functions/v2/https";

/**
 * Respond with "hello world" from specified endpoint.
 */
export const helloWorld = onCall((req) => {
  logger.info(`Receiving request with auth ${req.auth?.uid} and params ${req.data}`);
  return {
    message: "Hello from Centero! (This endpoint is for testing purposes only 🙏)",
  };
});