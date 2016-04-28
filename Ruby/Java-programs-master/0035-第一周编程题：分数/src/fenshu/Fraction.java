package fenshu;

import java.util.Scanner;

public class Fraction {
	
	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		Fractioner a = new Fractioner(in.nextInt(), in.nextInt());
		Fractioner b = new Fractioner(in.nextInt(),in.nextInt());
		a.print();
		b.print();
		a.plus(b).print();
		a.multiply(b).plus(new Fractioner(5,6)).print();
		a.print();
		b.print();
		in.close();
	}

}