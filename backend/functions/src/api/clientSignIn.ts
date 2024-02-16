import { admin, cors, getFirestore, logger, onCallable } from "../environment";

import { authenticateClient } from "../controllers/authentication/authentication";
import { storeToken } from "../controllers/token/storetoken";

/**
 * (IMPORTED)
 * Sign in a client and generate a token.
 */
export const clientSignIn = onCallable((req, res) => {
	cors(req, res, async () => {
		try {
			const { propertyName, unitNumber, social, deviceToken } = req.body;
			const conn = getFirestore();
			const [isValidUser, uid] = await authenticateClient(
				propertyName,
				unitNumber,
				social,
				conn
			);
			logger.log("herererereree");
			logger.log(`uid${uid}`);
			if (isValidUser) {
				admin
					.auth()
					.createCustomToken(`${uid}`)
					.then((customToken) => {
						res.status(200).json({ token: customToken, id: uid });
					});
				await storeToken(deviceToken, "client", conn, `${uid}`);
			} else {
				res.status(403).send("Invalid credentials");
				return;
			}
		} catch (error) {
			logger.log("Error creating custom token:", error);
			res.status(500).send("Internal server error");
			return;
		}
	});
})