export class SuccessServerResult {
		constructor (public httpCode: number, public resultObject:Object) {}
}

export class ErrorServerResult {
		constructor (public httpCode: number, public message:string) {}
}

export function getResult(result: SuccessServerResult) {
		if (result.httpCode === 200) {
				// Returning resultObject if everything is OK
				return result.resultObject;
		} else {
				// Returning result.message in case of error
				// help TypeScript Compiler to understand that result here
				// is the instance of ErrorServerResult...
				return ((<any>result) as ErrorServerResult).message;
		}
}
