import { admin, cors, getFirestore, logger, onCallable } from "../../environment";

import { alertmanager } from "../../controllers/messaging/alertmanager";
import { getmanager } from "../../controllers/callrouting/callrouting";
import { searchmanager } from "../../controllers/search/usersearch";
import { addcallsession } from "../../controllers/session/sessionupdate";

/**
 * (IMPORTED)
 * Used when a CLIENT request a manager
 * CALLING @getmanager service to get routed to a manager
 * use @search service to search for resident name
 * @session will be use to add (manager,resident) pair to call session
 * @alertmanager manager be alerted by user's request
 */
export const onRequestCall = onCallable(async (req, res) => {
  cors(req, res, async () => {
    // initializeApp();
    try {
      const body = req.body;
      const deviceToken = body.deviceToken;
      const rejected = body.rejected;
      const idToken = req.get("Authorization")?.split("Bearer ")[1];
      const conn = getFirestore();
      let id;
      if (idToken) {
        try {
          const decodedToken = await admin.auth().verifyIdToken(idToken);
          id = decodedToken.uid;
          logger.log(`id :${id}`);
        } catch (e) {
          res.status(401).send("Unauthorized");
          return;
        }
      } else {
        res.status(401).send("Unauthorized");
        return;
      }
      // get resident
      logger.log("getting the resident");
      logger.log(`id is ${id}`);
      const q = await conn.collection("Residents").where("uid", "==", id).get();
      if (q.size < 1) {
        res.status(401).send("User does not exist");
        return;
      }
      const resident = q.docs[0].data();
      logger.log("got resident");
      // route to manager
      let succeeded = false;
      let ifexist = false;
      let managertoken = "";
      let managername = "";
      let muid;
      // Call routing
      try {
        logger.log("routing to manager");
        if (rejected) {
          [succeeded, managertoken, muid] = await getmanager(
            conn,
            resident.propertyName,
            rejected
          );
        } else {
          logger.log("here!");
          logger.log(resident.propertyName);
          [succeeded, managertoken, muid] = await getmanager(
            conn,
            resident.propertyName
          );
        }
        if (succeeded) {
          [ifexist, managername] = await searchmanager(muid, conn);
        }
        // console.log(succeeded, ifexist, managertoken, muid, managername);
        if (!succeeded || !ifexist) {
          res.status(401).send("No Manager Available");
          return;
        }
      } catch (e) {
        logger.log(e);
        res.status(401).send("Internal Server Error");
        return;
      }
      // add session
      if (!(await addcallsession(deviceToken, managertoken, conn))) {
        logger.log("Could not create session");
        res.status(401).send("Could not create session");
        return;
      }
      // alert manager
      try {
        alertmanager("incoming call", managertoken, resident);
        res.status(200).send(managername);
        return;
      } catch (e) {
        logger.log(e);
        res.status(401).send("Internal Server Error");
        return;
      }
    } catch (error) {
      res.status(500).send("Internal Server Error");
      return;
    }
  });
});