/**
 * Low-level toolkit that provides access to common shared resources.
 */

// Firebase Admin
import * as admin from "firebase-admin";
export { admin }

// Cloud Functions
export * as functions from "firebase-functions";

// Firebase
export { getFirestore } from "firebase-admin/firestore";
export { firebaseCredentials } from "./config/firebase-config";

// CORS
export { cors } from "./config/cors-config";

// Logger
export { logger } from "firebase-functions";

// Endpoint Builder
import { onRequest, HttpsFunction, Request } from "firebase-functions/v2/https";
import { Response } from "express";
function onCallable(handler: (request: Request, response: Response) => void | Promise<void>): HttpsFunction {
	return onRequest(handler);
}
export { onCallable }