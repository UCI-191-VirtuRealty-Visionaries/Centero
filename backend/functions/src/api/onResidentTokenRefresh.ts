import { admin, cors, getFirestore, logger, onCallable } from "../environment";

import { refreshToken } from "../controllers/token/refreshtoken";

/**
 * (IMPORTED)
 * refresh resident token
 */
export const onResidentTokenRefresh = onCallable(async (req, res) => {
  cors(req, res, async () => {
    try {
      const {newToken} = req.body;

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
          refreshToken(newToken, "client", conn, uid);
        })
        .catch(() => {
          // The ID token is invalid or expired
          res.status(401).send("Unauthorized");
          return;
        });
    } catch (error) {
      logger.log(error);
      res.status(500).send("Internal server error");
      return;
    }
    res.status(200).send("success");
    return;
  });
});