package dome;

public class DVD extends Item {
	
	private String director;

	public DVD(String title, String director, int num, int playtime, String comment) {
		super( title, num, playtime, comment);
		this.director = director;
	}
	
	public void print() {
		System.out.println("["+"director:"+director+"]");
		super.print();
	}


}
