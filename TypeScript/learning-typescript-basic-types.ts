export enum Color {
		Red = 1,
	  Green = 2,
		Blue = 4
}

export var var1Boolean = true;
export var var2Decimal = 13;
export var var3Hex = 0xf00d;
export var var4Binary = 0b111111;
export var var5Octal = 0o744;
export var var6String = "Hello, world!";
export var var7Array = [1, 'test', {a: 3}, 4, 5];
export var var8NumericArray = [1, 2, 3, 4, 5];
export var var9Tuple = ['key', 12345];
export var var10Enum = Color.Blue;
export var var11ArrayOfAny = [1, 'test', {a: 3}, 4, 5];
export function var12VoidFunction(): void { };
export var var13Null = null;
export var var14Undefined = undefined;
export var var15NeverFunction = () => { throw new Error("wtf") };
