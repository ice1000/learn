#include <stdio.h>
#include <stdlib.h>
#include "zhenghe.h"

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
	char choose = '\0';
	int exit;
	printf("欢迎来到我的部分代码整合。加入COMET工作室后，我重新活过来了！\n");
	see();
	
	do
	{
		system("color 00");
		scanf("%c",&choose);
		
		switch( choose ){
			case 'p':
				printf("OK,收到。\n");
				primelist();
				printf("\n\n想要做什么？\n");
			break;
			
			case 'g':
				printf("OK,收到。\n");
				guess();
				printf("\n\n想要做什么？\n");
			break;
			
			case 'x':
				printf("OK,收到。\n");
				ai();
				printf("\n\n想要做什么？\n");
			break;
			
			case 's':
				printf("OK,收到。\n");
				shop();
				printf("\n\n想要做什么？\n");
			break;
			
			case 'a':
				printf("OK,收到。\n");
				see();
				printf("\n\n想要做什么？\n");
			break;
		
			case 'e':
				printf("确定退出吗？\n");
				printf("Y:是 N:否\n");
				
				scanf("%c",&exit);
				
				if(exit == 'Y'){
					choose = '\0';
				}else{
					choose = 'a';
				}
				printf("\n\n想要做什么？\n");
			break;
				
			default:
			break;
		}
	}while( choose );
	
	
	printf("thanks for using my program.\n\n\n\n                   ——ice1000 千里冰封\n\n\n");
	system("pause");
	return 0;
}


