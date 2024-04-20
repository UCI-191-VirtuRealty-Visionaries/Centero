import { initializeApp } from "firebase-admin/app";

// Configure
initializeApp();

// Exports (Keep Alphabetized)
export { authManager } from "./api/authManager";
export { getQueue } from "./api/getQueue";
export { helloWorld } from "./api/helloWorld";
export { setManagerStatus } from "./api/setManagerStatus";

// Legacy
// export { adminDeleteRecord } from "./api/legacy/adminDeleteRecord";
// export { clientSignIn } from "./api/legacy/clientSignIn";
// export { createManagerProfile } from "./api/legacy/createManagerProfile";
// export { getResident } from "./api/legacy/getResident";
// export { onAcceptCall } from "./api/legacy/onAcceptCall";
// export { onCancelCall } from "./api/legacy/onCancelCall";
// export { onManagerLogin } from "./api/legacy/onManagerLogin";
// export { onManagerLogout } from "./api/legacy/onManagerLogout";
// export { onManagerTokenRefresh } from "./api/legacy/onManagerTokenRefresh";
// export { onRejectCall } from "./api/legacy/onRejectCall";
// export { onRequestCall } from "./api/legacy/onRequestCall";
// export { onResidentLogout } from "./api/legacy/onResidentLogout";
// export { onResidentTokenRefresh } from "./api/legacy/onResidentTokenRefresh";