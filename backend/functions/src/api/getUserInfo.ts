import { getFirestore, logger } from "../environment";
import { onCall } from "firebase-functions/v2/https";

/**
 * Retrieve information about a specified user.
 */
export const getUserInfo = onCall(async (req) => {
	const db = getFirestore();

	const uid: string = req.data['uid'];
	const doc = await db.collection("Users").doc(uid).get();

	if (doc.exists) {
		logger.info(`Found data for user ${uid}`, doc);
		return {
			name: doc.data()?.['name'] ?? null,
		};
	} else {
		logger.error(`No data available for ${uid}`);
		return {
			name: 'Unknown',
		}
	}
});