package Main;

import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
	
		java.util.Scanner in = new java.util.Scanner(System.in);
		
		Clock clock = new Clock(in.nextInt(), in.nextInt(), in.nextInt());
	
		clock.tick();
	
		System.out.println(clock);
	
		in.close();

}

}

class Display {
	int value;
	private int limit;
	
	public Display( int limit )
	{
		this.limit = limit;
	}
	
	public void increase()
	{
		inc();
	}
	
	private void inc()
	{
		if( ++value == limit )
		{
			value = 0;
		}
	}
	
	public int getValue()
	{
		return value;
	}
}


class Clock {
	
	private Display hour = new Display(24);
	private Display minute = new Display(60);
	private Display second = new Display(60);
	
	Clock(int hour, int minute, int second)
	{
		this.hour.value = hour;
		this.minute.value = minute;
		this.second.value = second;
	}
	
	void tick()
	{
		second.increase();
		if( second.getValue() == 0 )
		{
			minute.increase();
			if( minute.getValue() == 0 )
			{
				hour.increase();
			}
		}
		
	}
	
	public String toString()
	{
		String time = new String();

		time = String.format("%02d:%02d:%02d",hour.getValue(),minute.getValue(),second.getValue());
		
		return time;
	}

}
