#include <stdio.h>
#include <stdlib.h>

int main(void){
	int a=12358;
	float b=3.1415;
	printf("首先\nint a=%d;\nfloat b=%f;\n",a,b);
	
	(float)a;
	(int)b;
	
	printf("接着强制类型转换！\n(float)a=%f;\n(int)b=%d;\n",a,b);//告诉你，转换出来就是一坨屎！ 
	
	printf("thanks for using my program.\n\n\n\n                   ——ice1000 千里冰封\n\n\n");
	system("pause");
	return 0;
 } 
