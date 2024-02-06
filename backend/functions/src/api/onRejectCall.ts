import { admin, cors, getFirestore, logger } from "../environment";

import { onRequest } from "firebase-functions/v2/https";

import { searchcallsession } from "../controllers/session/sessionsearch";
import { alertclient } from "../controllers/messaging/alertclient";
import { removecallsession } from "../controllers/session/sessionupdate";

/**
 * (IMPORTED)
 * Used when a MANAGER reject a recident's call request
 * @alertclient client be alerted by manager's rejection
 * @removecallsession to remove (manager,client) sessionpair
 * *********
 * FUTURE PLAN:
 * on the client side display "rerouting to a another manager"
 * the manager that rejected by client can be
 * cached in client browser (managerid1,managerid2)
 * client will recalling the requestcall endpoint after
 * a cool down of let's say 10 seconds sending the cached manager ids
 * so that we can filter out mannger that just rejected
 */
export const onRejectCall = onRequest(async (req, res) => {
	cors(req, res, async () => {
		try {
			const { deviceToken } = req.body;
			const conn = getFirestore();
			const idToken = req.get("Authorization")?.split("Bearer ")[1];
			let managerid: string;

			if (idToken) {
				try {
					const decodedToken = await admin.auth().verifyIdToken(idToken);
					managerid = decodedToken.uid;
					logger.log(`id :${managerid}`);
				} catch (e) {
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
					await alertclient("call rejected", clienttoken, managerid);
					res.status(200).send("sucess!");
				} else {
					res.status(401).send("client does not exist!");
					return;
				}
				await removecallsession(deviceToken, conn);
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