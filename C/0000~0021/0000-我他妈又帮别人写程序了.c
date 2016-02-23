#include <stdio.h>

int main(void){
	
	int a,b;
	char d;
	
	printf("整数计算器\n");
	
	scanf("%d%c%d",&a,&d,&b);
	switch ( d ){
		case '+':
			printf("%d+%d=%d",a,b,a+b);
		break;
		
		case '-':
			printf("%d+%d=%d",a,b,a-b);
		break;	
		
		case '*':
			printf("%d*%d=%d",a,b,a*b);
		break;
		
		case '/':
			printf("%d/%d=%d",a,b,a/b);
		break;
		
		default :
			printf("您的输入错误。\n");
		break; 
	}

	return 0;
}
