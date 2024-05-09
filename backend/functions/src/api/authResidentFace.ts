import { buildAuthResponse } from "../controllers/buildAuthResponse";
import { generateAuthToken } from "../controllers/generateAuthToken";
import { getMatchingFirestoreDoc } from "../controllers/getMatchingFirestoreDoc";
import { getFirestore, logger } from "../environment";
import { onCall } from "firebase-functions/v2/https";

/**
 * Authenticate a resident using a face scan.
 */
export const authResidentFace = onCall(async (req) => {
  const endpoint = await getRasberryPiAddress();
  if (endpoint === null) {
    return buildAuthResponse(null);
  }

  logger.info(`Sending request to`, endpoint);
  try {
    const response = await fetch(`http://${endpoint.ip}:${endpoint.port}`);
    logger.info(`Ok ${response.ok}, status ${response.status} ${response.statusText}`);

    const info = await response.json();
    logger.info(`Got response`, info);

    if (!info.success) {
      logger.warn('Error response from Rasberry Pi');
      return buildAuthResponse(null);
    }

    const username = info.userid;

    if (!username) {
      logger.warn('Username (userid) was not set in Rasberry Pi response');
      return buildAuthResponse(null);
    }

    const doc = await getMatchingFirestoreDoc(
      'ResidentCredentials',
      new Map([
        ['username', username],
      ]));

    if (doc == null) {
      logger.error(`Cannot log in as ${username}, credentials are invalid / user is not registered.`);
      return buildAuthResponse(null);
    }

    const token = await generateAuthToken(doc.data()['id'], ['resident']);
    return buildAuthResponse(token);
  } catch (err) {
    logger.error(err);
    return buildAuthResponse(null);
  }
});

interface Endpoint {
  ip: string;
  port: number;
}

async function getRasberryPiAddress(): Promise<Endpoint | null> {
  const db = getFirestore();
  const config = await db.collection('AppConfig').doc('FaceScan').get();
  if (!config.exists) {
    logger.error(`Configuration doc firebase/AppConfig/FaceScan has not been set.`);
    return null;
  }
  const ip = config.data()!['ip'];
  const port = Number.parseInt(config.data()!['port']);
  return { ip, port };
}