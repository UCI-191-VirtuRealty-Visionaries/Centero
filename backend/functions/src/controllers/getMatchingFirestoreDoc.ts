import { Filter } from "firebase-admin/firestore";
import { getFirestore } from "../environment";

export async function getMatchingFirestoreDoc(collection: string, fields: Map<string, any>) {
	const db = getFirestore();

	const filters: Filter[] = [];
	for (const [key, value] of fields) {
		filters.push(Filter.where(key, '==', value));
	}
	const matchExactly = Filter.and(...filters);

	const query = db.collection(collection).where(matchExactly).limit(1);
	const result = await query.get();

	if (result.empty) {
		return null;
	} else {
		return result.docs[0];
	}
}