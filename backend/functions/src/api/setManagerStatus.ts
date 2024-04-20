import { getFirestore, logger } from "../environment";
import { onCall } from "firebase-functions/v2/https";

/**
 * Retrieve information about a specified user.
 */
export const setManagerStatus = onCall(async (req) => {
	const db = getFirestore();

	const id = req.data["id"];
	const status = req.data["status"];
	const doc = db.collection("ActiveManagers").doc(id);
	
	await doc.set({ status });

	logger.info(`Set status of ${id} to ${status}`);

	return {
		result: "Success",
	};
});