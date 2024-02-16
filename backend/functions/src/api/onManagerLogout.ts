import { admin, cors, getFirestore, onCallable } from "../environment";

import { deleteToken } from "../controllers/token/deletetoken";

/**
 * (IMPORTED)
 * manager logout
 * delete manager device token from session
 */
export const onManagerLogout = onCallable(async (req, res) => {
	cors(req, res, async () => {
		try {
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
					deleteToken(uid, "manager", conn);
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