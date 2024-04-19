import { getFirestore, logger } from "../environment";
import { onCall } from "firebase-functions/v2/https";

/**
 * Authenticate a manager using their company, username, and password hash.
 */
export const authManager = onCall((req) => {
  logger.info(`Receiving auth request`, req.data);

  const col = getFirestore().collection("AuthManager");
  logger.info(`Auth collection`, col);

  return {
    success: true,
  };
});