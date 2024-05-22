import { cors, getFirestore, logger } from "../environment";
import { onCall } from "firebase-functions/v2/https";

/**
 * Retrieve information about a specified user.
 */
export const setManagerStatus = onCall({ cors: cors }, async (req) => {
	const db = getFirestore();

	const id: string = req.data["id"];
	const status: string = req.data["status"];

	switch (status) {
		case 'Offline':
			await db.collection('ActiveManagers').doc(id).delete();
			logger.info(`Removed ${id} from active list`);
			return { success: true, };

		default:
			const doc = db.collection("ActiveManagers").doc(id);
			await doc.set({ status: status });
			logger.info(`Set status of ${id} to ${status}`);
			return { success: true, };
	}
});