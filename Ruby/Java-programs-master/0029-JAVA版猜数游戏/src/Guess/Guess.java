package Guess;

import java.util.Scanner;

public class Guess {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int ans = (int) (Math.random()*100+1);
		int a = 0;
		int count = 0;
		System.out.println("请猜一个1~100的正整数~");
		Scanner in = new Scanner(System.in);
		do{
			a = in.nextInt();
			if ( a > ans )
				System.out.println("您猜的数 大 了。");
			else if ( a < ans ) 
				System.out.println("您猜的数 小 了。");
			count ++ ;
		}while ( a != ans );
		
		System.out.println("恭喜您猜对了，您一共猜了"+count+"次");
		System.out.println("\nthanks for using my program.\n\n                   ——ice1000 千里冰封");
		
		in.close();
	}
	
}
