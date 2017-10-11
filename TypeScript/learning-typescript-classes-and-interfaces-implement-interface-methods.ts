interface IGeometricFigure {
		area: () => number;
		perimeter: () => number;
}

export class Square implements IGeometricFigure {
		a = 0;
		constructor(i: number) { this.a = i; }
		area = () => { return this.a * this.a; }
		perimeter = () => { return this.a * 4; }
}

export class Circle implements IGeometricFigure {
		a = 0;
		PI = 3.141592653589793;
		constructor(i: number) { this.a = i; }
		area = () => { return this.a * this.a * this.PI };
		perimeter = () => { return this.a * 2 * this.PI };
}
