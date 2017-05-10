package cell;

import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		int chang;
		int kuan;
		
		int i,j;
		int times = 0,cnt = 0;
		int num = 0;
		
		Scanner get = new Scanner(System.in);
		
		chang = get.nextInt();
		kuan = get.nextInt();
		
		boolean[][] a = new boolean[chang][kuan];
		boolean[][] b = new boolean[chang][kuan];
		
		chang --;
		kuan --;
		
		for(i = 0; i <= chang; i++){
			for(j = 0;j <= kuan; j++){
				a[i][j] = false;
			}
		}
		
		for(i = 0; i <= chang; i++){
			for(j = 0;j <= kuan; j++){
				b[i][j] = false;
			}
		}
		
		i = 0;
		j = 0;
		
		do{
			a[i][j] = true;
			i = get.nextInt();
			j = get.nextInt();
		}while ((i != -1)||(j != -1));
		
		times = get.nextInt();

		for(cnt = 1; cnt <= times; cnt++){
			
			for(i = 0; i <= chang; i++){
				for(j = 0;j <= kuan; j++){
					b[i][j] = a[i][j];
				}
			}
			
			for(i = 0; i <= chang; i++){
				for(j = 0;j <= kuan; j++){
					num = 0;
					if((i != 0)&&(j != 0))
						if(a[i-1][j-1])
							num++;
					if(j != 0)
						if(a[i][j-1])
							num++;
					if((i != chang)&&(j != 0))
						if(a[i+1][j-1])
							num++;
					if(i != 0)
						if(a[i-1][j])
							num++;
					if(i != chang)
						if(a[i+1][j])
							num++;
					if((i != 0)&&(j != kuan))
						if(a[i-1][j+1])
							num++;
					if(j != kuan)
						if(a[i][j+1])
							num++;
					if((j != kuan)&&(i != chang))
						if(a[i+1][j+1])
							num++;
					
					switch (num) {
						case 2:
							break;
						case 3:
							b[i][j] = true;
							break;
						default:
							b[i][j] = false;
							break;
					}
//					System.out.println("a["+i+"]"+"["+j+"]="+a[i][j]);
				}
			}
//			System.out.println("");
			for(i = 0; i <= chang; i++){
				for(j = 0;j <= kuan; j++){
					a[i][j] = b[i][j];
				}
			}
		}
		
		num = 1;
		for(i = 0; i <= chang; i++){
			for(j = 0;j <= kuan; j++){
				if(a[i][j]){
					num ++;
				}
			}
		}
		
		System.out.println(num);
		get.close();
	}

}
