
class Display {
	public int value;
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
