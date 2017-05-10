package Homework;

import java.util.ArrayList;
import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int last = 0;
		Scanner in = new Scanner(System.in);
		chengshi2 a = new chengshi2();
		
		while(a.getnames( in.next() ));
		int[][] s = new int[a.getsize()][a.getsize()];
		
		for( int i = 0; i < a.getsize(); i++ )
		{
			for(int j = 0; j < a.getsize(); j++ )
			{
				s[i][j] = in.nextInt();
			}
		}
		
		last = s[a.printing(in.next())][a.printing(in.next())];
		
		System.out.println(last);
		
		in.close();
	}

}

class chengshi2 {

	private ArrayList<String> cities = new ArrayList<String>();

	public boolean getnames(String s) {
			if( !s.equals("###") )
			{
				cities.add(s);
				return true;
			}
			else 
			{
				return false;
			}
	}

	public int printing(String cityName) {
		return cities.indexOf(cityName);
	}

	public int getsize() {
		return cities.size();
	}

}