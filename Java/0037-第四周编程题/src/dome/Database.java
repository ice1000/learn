package dome;

import java.util.ArrayList;

public class Database {
	
	private ArrayList<CD> listOfCD = new ArrayList<CD>();
	
	public void add(CD cd) {
		listOfCD.add(cd);
	}
	
	public void list() {
		for( CD cd : listOfCD ) {
			cd.toString();
		}
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
