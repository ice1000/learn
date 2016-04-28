package Homework;

import java.util.ArrayList;
import java.util.Scanner;
//import java.util.StringTokenizer;

public class Mainhere {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int last = 0;
		Scanner in = new Scanner(System.in);
		chengshi a = new chengshi();
		
		while(a.getnames( in.next() ));
		int[][] s = new int[a.getsize()][a.getsize()];

//		for( int j = 0; j < a.getsize(); j++ )
//		{
//			for(int i = 0; i < a.getsize(); i++ )
//			{
//				a.getdistance(in.nextInt(),i,j);
//			}
//		}
		
		for( int i = 0; i < a.getsize(); i++ )
		{
			for(int j = 0; j < a.getsize(); j++ )
			{
				s[i][j] = in.nextInt();
			}
		}
		
//		System.out.println((in.next(), in.next()));
		last = s[a.printing(in.next())][a.printing(in.next())];
		
		System.out.println(last);
		
		in.close();
	}

}

class chengshi {

//	private HashMap<city,Integer> distance = new HashMap<city,Integer>();
//	private HashMap<String, String> city = new HashMap<String, String>();
	private ArrayList<String> cities = new ArrayList<String>();
//	private in t c n t = 0;
//	
//	class city {
//		String city1;
//		String city2;
//	}
//	city nowcity = new city();

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

//	public void getdistance(int is, int num1, int num2) {
////here needs checking.
//		nowcity.city1 = cities.get(num1);
//		nowcity.city2 = cities.get(num2);
//
//		distance.put(nowcity, is);
////		c n t ++;
////
////		if( c  n t > cities.size() )
////		{
////			c n t = 0;
////		}
//	}

//	public int printing(String from, String to) {
//		nowcity.city1 = from;
//		nowcity.city2 = to;
//
//		return distance.get(nowcity);
//
//	}
	
	public int printing(String cityName) {
		return cities.indexOf(cityName);
	}

	public int getsize() {
		return cities.size();
	}

}