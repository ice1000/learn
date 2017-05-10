#include <stdio.h>
#include <stdlib.h>

enum language { C, Cpp, JAVA, Swift, JS, PHP, num, };

int main(void){
	enum language a = C, b = Cpp; 
	printf("a=(int)%d\n",a);//输出结果为0。 
	printf("b=(char)%c\n",b);//输出结果是ASCII码的1——笑脸！ 
	
	printf("这个程序告诉我们，枚举并没有什么卵用。\n");
	printf ("thanks for using my program.\n\n\n\n                   ——ice1000 千里冰封\n\n\n");
	system("pause");
	return 0;
}
