/**
 * Builds a JSON response to an authentication request.
 */
export function buildAuthResponse(token: string | null | undefined) {
	if (token === null || token === undefined) {
		return {
			success: false,
		};
	} else {
		return {
			success: true,
			token: token,
		};
	}
}