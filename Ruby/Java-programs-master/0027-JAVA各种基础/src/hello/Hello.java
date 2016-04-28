package hello;

import java.util.Scanner;

public class Hello {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int a = 0;
		System.out.println("echo:请输入一句话。我来重复你。");
		Scanner in = new Scanner(System.in);
		System.out.println("echo:"+in.nextLine());
		System.out.println("echo:接下来我将为你做一个简单的运算。就是100-你输入的数。\necho:请输入。");
		a = in.nextInt();
		System.out.println("100-"+a+"="+(100-a));
		System.out.println("\nthanks for using my program.\n\n\n\n                   ——ice1000 千里冰封\n\n");
	}

}