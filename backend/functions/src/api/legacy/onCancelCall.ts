import { cors, getFirestore, logger, onCallable } from "../../environment";

import { searchcallsessionfromclient } from "../../controllers/session/sessionsearch";
import { alertmanager } from "../../controllers/messaging/alertmanager";
import { removecallsession } from "../../controllers/session/sessionupdate";

/**
 * (IMPORTED)
 * Used when a CLIENT cancel a call during the middle of the call
 * @alertmanager alert manager that the call is cancelled
 * @removecallsession to remove (manager,client) sessionpair
 *********
 * frontend of the manager needs to handle the alert differently,
 * cancelling call before the manager click accept will simply remove
 * the popup message box
 * cancelling call during the call will lead manager back to the homepage
 */
export const onCancelCall = onCallable(async (req, res) => {
	cors(req, res, async () => {
		try {
			const { deviceToken } = req.body;
			const conn = getFirestore();
			const idToken = req.get("Authorization")?.split("Bearer ")[1];
			if (!idToken) {
				res.status(401).send("Unauthorized");
				return;
			}
			try {
				const managertoken = await searchcallsessionfromclient(
					deviceToken,
					conn
				);
				if (managertoken) {
					logger.log(`manager token is fetched ${managertoken}`);
					await alertmanager("call cancelled", managertoken, null);
				} else {
					res.status(401).send("manager does not exist!");
					return;
				}
				await removecallsession(managertoken, conn);
				res.status(200).send("sucess!");
				return;
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