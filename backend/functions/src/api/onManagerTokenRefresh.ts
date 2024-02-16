import { admin, cors, getFirestore, onCallable } from "../environment";

import { refreshToken } from "../controllers/token/refreshtoken";

/**
 * (IMPORTED)
 * manager token refresh
 */
export const onManagerTokenRefresh = onCallable(async (req, res) => {
	cors(req, res, async () => {
		try {
			const { newToken } = req.body;

			const conn = getFirestore();

			const idToken = req.get("Authorization")?.split("Bearer ")[1];

			if (!idToken) {
				res.status(401).send("Unauthorized");
				return;
			}

			try {
				const decodedToken = await admin.auth().verifyIdToken(idToken);
				const uid = decodedToken.uid;
				if (await refreshToken(newToken, "manager", conn, uid)) {
					res.status(200).send("success");
					return;
				}
				res.status(401).send("can't refresh token");
				return;
			} catch (error) {
				res.status(401).send("Unauthorized");
				return;
			}
		} catch (error) {
			res.status(500).send("Internal server error");
			return;
		}
	});
});