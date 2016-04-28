package Main;

import java.util.Scanner;

public class Main {
	
	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		Fraction a = new Fraction(in.nextInt(), in.nextInt());
		Fraction b = new Fraction(in.nextInt(),in.nextInt());
		a.print();
		b.print();
		a.plus(b).print();
		a.multiply(b).plus(new Fraction(5,6)).print();
		a.print();
		b.print();
		in.close();
	}

}

class Fraction{
	int son;
	int mum;
	Fraction(int ason, int amum)
	{
		int as;
		if( ason > amum )
		{
			as = amum;
		}
		else
		{
			as = ason;
		}
		int i = 2; 
		while( i <= as )
		{
			if( ( (ason % i) == 0) && ((amum % i) == 0 ) )
			{
				ason /= i;
				amum /= i;
			}
			else
			{
				i ++;
			}
		}
		this.son = ason;
		this.mum = amum;
	}

	void print()
	{
		if ( son == mum )
		{
			System.out.println("1");
		}
		else
		{
			System.out.println(son+"/"+mum);
		}
	}

	double toDouble()
	{
		return (((double)son)/mum);
	}

	Fraction plus(Fraction r)
	{
		int rson = this.son * r.mum + this.mum * r.son;
		int rmum = this.mum * r.mum;
		Fraction result = new Fraction(rson,rmum);
		return result;
	}

	Fraction multiply(Fraction r)
	{
		int nson = this.son * r.son;
		int nmum = this.mum * r.mum;
		Fraction value = new Fraction(nson,nmum);
		return value;

	}
 
}