import { getFirestore, logger } from "../environment";
import { onCall } from "firebase-functions/v2/https";

/**
 * Retrieve the queue of waiting residents.
 */
export const getQueue = onCall(async (req) => {
	const db = getFirestore();

	const col = await db.collection("CallQueue").get();
	const docs = col.docs.map(x => ({
		id: x.id,
		userid: x.data()['userid'],
	}));

	logger.info('Retrieved docs in CallQueue', docs);

	return {
		docs,
	};
});