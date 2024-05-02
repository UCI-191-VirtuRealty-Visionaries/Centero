import { logger } from "../environment";
import { onCall } from "firebase-functions/v2/https";

/**
 * Authenticate a resident using a face scan.
 */
export const authResidentFace = onCall(async (req) => {
  logger.info(`Receiving face scan request auth request`, req.data);

  return {
    success: false,
  }
});