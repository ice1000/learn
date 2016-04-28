package Ordered;

import java.util.ArrayList;

public class Notebook {
	
	private ArrayList<String> notes = new ArrayList<String>();
	
	public void add( String s ) {
		notes.add(s);
	}
	
	public void add( String s, int index ) {
		notes.add(index, s);
	}
	
	public int getSize() {
		return notes.size();
	}
	
	public String getNote( int index ) {
		return notes.get(index);
	}
	
	public void deletNote( int index ) {
		notes.remove(index);
	}
	
	public String[] list() {
		String[] a = new String[notes.size()];
//		for( int i = 0; i < notes.size(); i++ ){
//			a[i] = notes.get(i);
//		}
		notes.toArray(a);
		return a;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
	}

}
