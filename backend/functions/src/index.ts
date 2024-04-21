import { initializeApp } from "firebase-admin/app";

// Configure
initializeApp();

// Exports (Keep Alphabetized)
export { authManager } from "./api/authManager";
export { getQueue } from "./api/getQueue";
export { helloWorld } from "./api/helloWorld";
export { setManagerStatus } from "./api/setManagerStatus";