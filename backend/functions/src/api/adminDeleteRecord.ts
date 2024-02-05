import { cors, getFirestore } from "../environment";

import { onRequest } from "firebase-functions/v2/https";

import { deleteDocument } from "../controllers/admin/deleterecord";

/**
 * (IMPORTED)
 * delete resident devicetoken from sessionstore when log out
 */
export const adminDeleteRecord = onRequest(async (req, res) => {
	cors(req, res, async () => {
		// initializeApp();
		try {
			const conn = await getFirestore();
			const collection = req.body.collection;
			const doc = req.body.doc;
			await deleteDocument(collection, doc, conn);
		} catch (error) {
			res.status(500).send("Internal server error");
		}
		res.status(200).send("success");
	});
});