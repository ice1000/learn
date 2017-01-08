package org.ice1000;

public class Main {

	public native void foo();

	public native int bar(int param1);

	public static void main(String[] args) {
		System.loadLibrary("jni");
		Main main = new Main();
		main.foo();
		for (int i : new int[]{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 20, 30, 40}) {
			System.out.println(main.bar(i));
		}
	}
}
