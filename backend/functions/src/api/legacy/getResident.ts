import { admin, cors, onCallable } from "../../environment";

/**
 * (IMPORTED)
 */
export const getResident = onCallable(async (req, res) => {
  cors(req, res, async () => {
    try {
      const {uid} = req.body;
      const query = await admin
        .firestore()
        .collection("Residents")
        .where("uid", "==", uid)
        .get();
      if (query.size < 1) {
        res.status(404).send("User id not found");
      } else if (query.size > 1) {
        res.status(403).send("Error: Duplicate users");
      } else {
        const data = query.docs[0].data();
        res.status(200).json({
          name: data.name,
          unit: data.unit,
          uid: uid,
          propertyName: data.propertyName,
          address: data.address,
          leaseStart: data.leaseStart,
          leaseEnd: data.leaseEnd,
          rent: data.rent,
          rentDueDate: data.rentDueDate,
          deposit: data.deposit,
          petRent: data.petRent,
          lastCall: data.lastCall,
        });
      }
    } catch (error) {
      res.status(500).send("Internal Server Error");
    }
  });
});