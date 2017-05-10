#include <stdio.h>
#include <stdlib.h>

int main(void){
	void *p;
	int zijie=0;
	
	printf("本程序可能会引起系统崩溃，请谨慎使用。\n");
	
	while ( p=malloc(1024*1024*1024) ){
		zijie++;
	}
	free(p);
	
	printf("共能分配 %dGB 的内存。（不同机器运行结果不同）\nO(∩_∩)O哈哈~\n",zijie);
	printf("thanks for using my program.\n\n\n\n                   ——ice1000 千里冰封\n\n\n");
	system("pause");
	
	return 0;
}
