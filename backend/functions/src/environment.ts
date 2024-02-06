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