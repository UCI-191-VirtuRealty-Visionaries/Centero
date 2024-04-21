import { getAuth } from "firebase-admin/auth";
import { logger } from "../environment";

export async function generateAuthToken(id: string, claims: object = {}): Promise<string | null> {
  try {
    return await getAuth().createCustomToken(id, claims);
  } catch (error) {
    logger.error(`Token generation failed for '${id}'`, error);
    return null;
  }
}