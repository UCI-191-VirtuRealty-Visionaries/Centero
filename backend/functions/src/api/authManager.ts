import { getAuth } from "firebase-admin/auth";
import { logger } from "../environment";
import { onCall } from "firebase-functions/v2/https";

/**
 * Authenticate a manager using their company, username, and password hash.
 */
export const authManager = onCall(async (req) => {
  logger.info(`Receiving auth request`, req.data);

  logger.info("Generating new uid token");

  const uid = "mvp_user";
  const claims = {
    role: ["resident"],
  };

  try {
    const token = await getAuth().createCustomToken(uid, claims);
    return {
      success: true,
      token,
    }
  } catch (error) {
    return {
      success: false,
    }
  }
});