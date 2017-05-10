#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void guess(void){
	
	srand(time(0));
	int a=rand(),x,n=1;
	a %= 100; 
	printf("猜数游戏：\n请猜一个1到100的整数~~~\n");
	scanf("%d",&x);
	
	while (x != a) {
		if (x > a) {
			printf ("您猜的数 大 了。\n"); 
		} else {
			printf ("您猜的数 小 了。\n");
		}
		n++;
		scanf ("%d",&x);
	}
	printf ("恭喜您答对了，您一共猜了%d次就猜到了正确答案！^_^\n温馨提示：\n本游戏步数最多不超过 7 步。\n",n);
	
	printf ("thanks for using my program.\n\n\n\n                   ——ice1000 千里冰封\n\n\n");
	system("pause");
} 
