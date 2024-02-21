import { logger, onCallable } from "../environment";

/**
 * Respond with "hello world" from specified endpoint.
 */
export const helloWorld = onCallable((req, res) => {
  logger.info("Hello, logs!");
  res.send("Hello from Centero! (This endpoint is for testing purposes only 🙏)");
});