package dome;

public class MP3 extends Item {

	private String singer;
	private String songText;

	public MP3(String title, String singer, int num, int playtime, String comment, String songText) {
		super( title, num, playtime, comment);
		this.singer = singer;
		this.songText = songText;
	}
	
	public void print() {
		System.out.println("["+"singer:"+singer+"]");
		super.print();
	}
	
	public void printTExt() {
		System.out.println(songText);
	}
	
}
