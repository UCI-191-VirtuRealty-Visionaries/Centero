import { getAuth } from "firebase-admin/auth";
import { getFirestore, logger } from "../environment";
import { onCall } from "firebase-functions/v2/https";
import { Filter } from "firebase-admin/firestore";

async function getMatchingDoc(company: string, id: string, hash: string) {
  const db = getFirestore();

  const matchExactly = Filter.and(
    Filter.where('company', '==', company),
    Filter.where('id', '==', id),
    Filter.where('passwordHash', '==', hash),
  );

  const query = db.collection('ManagerCredentials').where(matchExactly).limit(1);
  const result = await query.get();

  if (result.empty) {
    return null;
  } else {
    return result.docs[0];
  }
}

async function createToken(company: string, id: string): Promise<string | null> {
  const uid = `${company} : ${id}`;
  const claims = {
    role: ["manager"],
  };

  try {
    return await getAuth().createCustomToken(uid, claims);
  } catch (error) {
    logger.error(`Token generation failed for '${uid}'`, error);
    return null;
  }
}

/**
 * Authenticate a manager using their company, username, and password hash.
 */
export const authManager = onCall(async (req) => {
  logger.info(`Receiving auth request`, req.data);

  const company = req.data['company'];
  const id = req.data['id'];
  const hash = req.data['hash'];

  const doc = getMatchingDoc(company, id, hash)

  if (doc == null) {
    logger.error(`Cannot log in as ${id}, credentials are invalid / user is not registered.`);
    return {
      success: false,
    }
  }

  const token = await createToken(company, id);

  if (token == null) {
    return {
      success: false,
    }
  }

  return {
    success: true,
    token,
  }
});