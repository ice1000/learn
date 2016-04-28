package fenshu;

class Fractioner{
	private int son;
	private int mum;
	
	Fractioner(int ason, int amum)
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

	public void print()
	{
		printinto();
	}
	
	private void printinto()
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

	Fractioner plus(Fractioner r)
	{
		int rson = this.son * r.mum + this.mum * r.son;
		int rmum = this.mum * r.mum;
		return new Fractioner(rson,rmum);
	}

	Fractioner multiply(Fractioner r)
	{
		int nson = this.son * r.son;
		int nmum = this.mum * r.mum;
		return new Fractioner(nson,nmum);

	}
 
}