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
		scanf("%d",&choose);
		
		if( choose >= 0 && choose <= 6 ){
			printf("OK,收到。\n");
			(pf[choose])();
			printf("想要做什么？\n");
			system("cls");
		}

	}while( choose );
	
	
	printf("thanks for using my program.\n\n\n\n                   ——ice1000 千里冰封\n\n\n");
	system("pause");
	return 0;
}


