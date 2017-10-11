declare var IAnimal: {
		new (
				name: string,
				age: number,
				legs: number,
				species: string,
				status: string
		): IAnimal;
}

export interface IAnimal {
		name: string;
		age: number;
		legs: number;
		species: string;
		status: string;
		introduce: () => string;
}

export class Animal implements IAnimal {
		name = "长者";
		age = 2017 - 1926;
		legs = 233666;
		species = "frog";
		status = "万寿无疆";
		constructor(n: string, a: number, l: number, s1: string, s: string) {
				this.name = n;
				this.age = a;
				this.species = s1;
				this.legs = l;
				this.status = s;
		}

		introduce() {
				return `Hello, my name is ${this.name} and I am ${this.age} years old.`;
		}
}

export class Shark implements IAnimal {
		name = "+1s";
		age = 2017 - 1926;
		legs = 0;
		species = "shark";
		status = "谈笑风生";
		constructor(n: string, a: number, s: string) {
				this.name = n;
				this.age = a;
				this.status = s;
		}

		introduce() {
				return `Hello, my name is ${this.name} and I am ${this.age} years old.`;
		}
}

export class Cat implements IAnimal {
		name = "江可泽民";
		age = 2017 - 1926;
		legs = 4;
		species = "cat";
		status = "亦可赛艇";
		constructor(n: string, a: number, s: string) {
				this.name = n;
				this.age = a;
				this.status = s;
		}

		introduce() {
				return `Hello, my name is ${this.name} and I am ${this.age} years old.  Meow meow!`;
		}
}

export class Dog implements IAnimal {
		name = "苟利国家生死以";
		age = 2017 - 1926;
		legs = 4;
		master = "传授人生经验";
		species = "dog";
		status = "岂因祸福避趋之";
		greetMaster() { return `Hello ${this.master}`; }
		constructor(n: string, a: number, s: string, m: string) {
				this.name = n;
				this.age = a;
				this.status = s;
				this.master = m;
		}
		introduce() {
				return `Hello, my name is ${this.name} and I am ${this.age} years old.`;
		}
}

