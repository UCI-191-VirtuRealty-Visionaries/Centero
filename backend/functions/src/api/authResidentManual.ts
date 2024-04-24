import { logger } from "../environment";
import { onCall } from "firebase-functions/v2/https";
import { generateAuthToken } from "../controllers/generateAuthToken";
import { getMatchingFirestoreDoc } from "../controllers/getMatchingFirestoreDoc";
import { buildAuthResponse } from "../controllers/buildAuthResponse";

/**
 * Authenticate a resident using a face scan.
 */
export const authResidentManual = onCall(async (req) => {
  logger.info(`Receiving resident auth request`, req.data);

  const username = req.data['username'];
  const passwordHash = req.data['passwordHash'];

  const doc = await getMatchingFirestoreDoc(new Map([
    ['username', username],
    ['passwordHash', passwordHash],
  ]));

  if (doc == null) {
    logger.error(`Cannot log in as ${username}, credentials are invalid / user is not registered.`);
    return buildAuthResponse(null);
  }

  const token = await generateAuthToken(doc.data()['id'], ['resident']);
  return buildAuthResponse(token);
});