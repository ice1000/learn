package Calculate;

import java.util.Scanner;

public class Calc {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int foot = 0;
		int inch = 0;
		System.out.println("欢迎来到这个操蛋的单位换算程序。");
		System.out.println("请输入英制单位：先输入尺，再输入寸。");
		Scanner in = new Scanner(System.in);
		
		while (true){
			foot = in.nextInt();
			inch = in.nextInt();
			if ( foot >= 0 && inch >= 0 && inch <= 12 ){
				System.out.println("中文单位为："+((foot+(inch/12.00))*30.48)+"厘米");
				System.out.println("\nthanks for using my program.\n\n\n\n                   ——ice1000 千里冰封\n\n");
				break;
			}else{
				System.out.println("尼玛！输入一个正常的数字不行吗！！");
			}
		}
	}
}
