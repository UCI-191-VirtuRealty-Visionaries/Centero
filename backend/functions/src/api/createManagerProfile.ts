import { admin, functions } from "../environment";

// TODO Possibly using v1 Cloud Functions API with `onCreate()`.

/**
 * (IMPORTED)
 * whenever manager account is added on firebase auth
 * firebase firestore will also be updated
 */
export const createManagerProfile = functions.auth.user().onCreate((user) => {
	// user is the newly created user
	const userRef = admin.firestore().collection("Managers").doc(user.uid);
	return userRef.set({
		email: user.email,
		uid: user.uid,
	});
});