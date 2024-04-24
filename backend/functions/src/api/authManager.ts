import { logger } from "../environment";
import { onCall } from "firebase-functions/v2/https";
import { generateAuthToken } from "../controllers/generateAuthToken";
import { getMatchingFirestoreDoc } from "../controllers/getMatchingFirestoreDoc";
import { buildAuthResponse } from "../controllers/buildAuthResponse";

/**
 * Authenticate a manager using their company, username, and password hash.
 */
export const authManager = onCall(async (req) => {
  logger.info(`Receiving manager auth request`, req.data);

  const company = req.data['company'];
  const username = req.data['username'];
  const passwordHash = req.data['passwordHash'];

  const doc = await getMatchingFirestoreDoc(
    'ManagerCredentials',
    new Map([
      ['company', company],
      ['username', username],
      ['passwordHash', passwordHash],
    ]),
  );

  if (doc == null) {
    logger.error(`Cannot log in as ${username}, credentials are invalid / user is not registered.`);
    return buildAuthResponse(null);
  }

  const token = await generateAuthToken(doc.data()['id'], ['manager']);
  return buildAuthResponse(token);
});