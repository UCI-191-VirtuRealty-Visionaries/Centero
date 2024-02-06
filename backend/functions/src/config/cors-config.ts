import * as corsLib from "cors";

const whitelist = [
	/^https:\/\/centerobackend\.web\.app$/,
	/^http:\/\/localhost(:\d+)?$/,
];

const corsOptions: corsLib.CorsOptions = {
	origin: function (origin, callback) {
		const isServerToServer = !origin;
		const isWhitelisted = origin !== undefined && whitelist.some(regex => regex.test(origin));

		if (isServerToServer || isWhitelisted) {
			callback(null, true);
		} else {
			callback(new Error("[CORS] Request not authorized."));
		}
	},
};

export const cors = corsLib(corsOptions);