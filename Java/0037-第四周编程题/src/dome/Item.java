package dome;

public class Item {
	
	private String title;
	private int num;
	private int playtime;
	private boolean gotIt = false;
	private String comment;
	
	public Item(String title, int num, int playtime, String comment) {
//		super();
		this.title = title;
		this.num = num;
		this.playtime = playtime;
		this.comment = comment;
	}
	
	public void print() {
		System.out.print(title);
	}
	
	public String toString() {
		System.out.println("["+"name:"+title+",num:"+num+",playTime:"+playtime+"]");
		System.out.println("["+"comment:"+comment+"]");
		if( gotIt ) {
			System.out.println("got it now.");
		}
		else
		{
			System.out.println("not got it now.");	
		}
		return "";
	}

//	public static void main(String[] args) {
//		// TODO Auto-generated method stub
//
//	}

}
