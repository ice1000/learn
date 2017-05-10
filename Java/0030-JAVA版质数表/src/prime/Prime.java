package prime;

import java.util.Scanner;

public class Prime {

	public static void main(String[] args) {
		// TODO Auto-generated method stub	
		int aa;
		Scanner in = new Scanner(System.in);
		System.out.printf("您要生成多少个质数的表？\n");
		
		aa = in.nextInt();
		
		int[] a = new int[aa];
		int i=2,k;
		int index=0;
		int n;
		boolean is = true;
		
		a[0] = 2;
		
		while ( index < aa )
		{
			is = true;
			k=i;
			for ( n = 0; a[n] <= Math.sqrt(k); n ++ )
			{
				if ( k % a[n] == 0 )
				{
					is = false;
					break;
				}
			}
			if ( is )
			{
				a[index] = i;
				index ++;
				//如果发现新质数就向前移一个。
			}
			i++;//往前数一个数。
		}
		
		n = 0;
		
		for ( int j : a )
		{
			System.out.printf("%d\t",j);
			if ( n % 15 == 14 )
			{
				System.out.printf("\n");
			}
			n++;
		}
		//输出质数表。
	System.out.println("\nthanks for using my program.\n\n\n\n                   ——ice1000 千里冰封\n\n");
	}

}
