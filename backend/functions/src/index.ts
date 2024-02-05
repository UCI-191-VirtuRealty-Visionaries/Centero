import { initializeApp } from "firebase-admin/app";

// Configure
initializeApp();

// Exports
export { helloWorld } from "./api/helloWorld";
export { clientSignIn } from "./api/clientSignIn";