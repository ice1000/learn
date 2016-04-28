
class Clock {
	
	private Display hour = new Display(24);
	private Display minute = new Display(60);
	private Display second = new Display(60);
	
	public Clock(int hour, int minute, int second)
	{
		setclock(hour, minute, second);
	}
	private void setclock(int hour, int minute, int second)
	{
		this.hour.value = hour;
		this.minute.value = minute;
		this.second.value = second;
	}
//·â×°¡£	
	public void tick()
	{
		settick();
	}
	private void settick()
	{
		second.increase();
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if( second.getValue() == 0 )
		{
			minute.increase();
			if( minute.getValue() == 0 )
			{
				hour.increase();
			}
		}
		System.out.printf("%02d:%02d:%02d\n",hour.getValue(),minute.getValue(),second.getValue());
	}
//·â×°¡£
	public String toString()
	{
		return (settoString());
	}
	private String settoString()
	{
		String time = new String();
		time = String.format("%02d:%02d:%02d",hour.getValue(),minute.getValue(),second.getValue());
		return time;
	}
//·â×°¡£
}
