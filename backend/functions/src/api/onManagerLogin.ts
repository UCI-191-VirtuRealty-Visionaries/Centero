import { admin, cors, getFirestore } from "../environment";

import { onRequest } from "firebase-functions/v2/https";

import { storeToken } from "../controllers/token/storetoken";

/**
 * (IMPORTED)
 * Called after manager authenticates with firebase auth
 * add manager device token to managerstore
 */
export const onManagerLogin = onRequest(async (req, res) => {
	cors(req, res, async () => {
		try {
			const { deviceToken } = req.body;

			const conn = getFirestore();

			const idToken = req.get("Authorization")?.split("Bearer ")[1];

			if (!idToken) {
				res.status(401).send("Unauthorized");
				return;
			}

			admin
				.auth()
				.verifyIdToken(idToken)
				.then((decodedToken) => {
					const uid = decodedToken.uid;
					storeToken(deviceToken, "manager", conn, uid);
				})
				.catch(() => {
					// The ID token is invalid or expired
					res.status(401).send("Unauthorized");
					return;
				});
		} catch (error) {
			res.status(500).send("Internal server error");
			return;
		}
		res.status(200).send("success");
	});
});