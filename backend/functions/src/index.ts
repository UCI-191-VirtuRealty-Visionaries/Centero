// ==================================================
// Imports
// ==================================================

// Config
// import { firebaseCredentials } from "./config/firebase-config";
// import { cors } from "./config/cors-config";

// Firebase Admin
import { initializeApp } from "firebase-admin/app";
// import { getFirestore } from "firebase-admin/firestore";

// Firebase Cloud Functions
// Full List at https://firebase.google.com/docs/functions
import { logger } from "firebase-functions";
import { onRequest } from "firebase-functions/v2/https";

// ==================================================
// Setup
// ==================================================

initializeApp();
// const firestore = getFirestore();

// ==================================================
// Exports
// ==================================================

export const helloWorld = onRequest((req, res) => {
  logger.info("Hello, logs!");
  res.send("Hello from Centero! (This endpoint is for testing purposes only 🙏)");
});