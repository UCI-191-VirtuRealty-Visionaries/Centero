import { initializeApp } from "firebase-admin/app";

// Configure
initializeApp();

// Exports (Keep Alphabetized)
export { adminDeleteRecord } from "./api/adminDeleteRecord";
export { clientSignIn } from "./api/clientSignIn";
export { createManagerProfile } from "./api/createManagerProfile";
export { getResident } from "./api/getResident";
export { helloWorld } from "./api/helloWorld";
export { onAcceptCall } from "./api/onAcceptCall";
export { onCancelCall } from "./api/onCancelCall";
export { onManagerLogin } from "./api/onManagerLogin";
export { onManagerLogout } from "./api/onManagerLogout";
export { onManagerTokenRefresh } from "./api/onManagerTokenRefresh";
export { onRejectCall } from "./api/onRejectCall";
export { onRequestCall } from "./api/onRequestCall";
export { onResidentLogout } from "./api/onResidentLogout";
export { onResidentTokenRefresh } from "./api/onResidentTokenRefresh";