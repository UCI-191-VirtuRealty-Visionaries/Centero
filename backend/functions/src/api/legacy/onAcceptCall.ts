import { admin, cors, getFirestore, logger, onCallable } from "../../environment";

import { searchcallsession } from "../../controllers/session/sessionsearch";
import { alertclient } from "../../controllers/messaging/alertclient";

/**
 * (IMPORTED)
 * Used when a MANAGER accept a recident's call request
 * @alertclient client be alerted by manager's acceptance
 *
 * *********
 * FUTURE PLAN: we will also initiate a actual video session
 * from this endpoint
 */
export const onAcceptCall = onCallable(async (req, res) => {
	cors(req, res, async () => {
		try {
			const { deviceToken } = req.body;
			const conn = await getFirestore();
			const idToken = req.get("Authorization")?.split("Bearer ")[1];
			if (!idToken) {
				res.status(401).send("Unauthorized");
				return;
			}
			if (idToken) {
				try {
					await admin.auth().verifyIdToken(idToken);
				} catch (e) {
					logger.log(e);
					res.status(401).send("Unauthorized");
					return;
				}
			} else {
				res.status(401).send("Unauthorized");
				return;
			}
			try {
				const clienttoken = await searchcallsession(
					deviceToken,
					conn
				);
				if (clienttoken) {
					await alertclient("call accepted", clienttoken);
					res.status(200).send("success!");
					return;
				} else {
					res.status(401).send("client does not exist!");
					return;
				}
			} catch {
				res.status(401).send("Unauthorized");
				return;
			}
		} catch (error) {
			res.status(500).send("Internal server error");
			return;
		}
	});
});
