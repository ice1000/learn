package dome;

public class CD extends Item {
	
	private String artist;

	public CD(String title, String artist, int num, int playtime, String comment) {
		super( title, num, playtime, comment);
		this.artist = artist;
	}
	
	public void print() {
		System.out.println("["+"artist:"+artist+"]");
		super.print();
	}


}
