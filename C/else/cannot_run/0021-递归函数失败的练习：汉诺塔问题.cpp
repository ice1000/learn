#include <stdio.h>
#include <stdlib.h>

void answer( int n , char x, char y, char z ){

	if ( n == 1 ){
		printf("a->c;"); 
	}
	else{
		answer((n-1),x,z,y);
		printf("%c->%c;",x,z);
		answer((n-1),y,x,z);
	}
}//递归函数 

int main(void){
	int a;
	
	printf("欢迎来到我的程序。\n本程序用于生成一个汉诺塔问题的解。\n至于什么是汉诺塔问题，请自行百度。\n现在请输入圆盘的数量。\n（注：初始圆盘是A，目标是C，媒介是B）\n");
	scanf("%d",&a);
	printf("\n");
	
	answer(a,'a','b','c');
	
	printf("\nthanks for using my program.\n\n\n\n                   ——ice1000 千里冰封\n\n\n");
	system("pause");
	return 0;
}

