#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int real_ice_strlen ( const char *q1 );

int main(void){

	char p[]={"Hello_world"};
	
	printf("目前定义数组：\nchar p[]={\"Hello_world\"};\n下面是各个函数的返回值。\n这是我少有的静态程序呢~\n");
	
	printf("sizeof(p)=%d,\n",sizeof(p));	
	printf("strlen(p)=%d,\n",strlen(p));
	printf("real_ice_strlen(p)=%d,\n",real_ice_strlen(p));
	printf("ice_strlen(p)=%d,\n",sizeof(p)-1);
	
	printf("\n我已经没有动力写其它几个了==\n");
	
	printf ("thanks for using my program.\n\n\n\n                   ——ice1000 千里冰封\n\n\n");
	system("pause");
	return 0;
}

int real_ice_strlen ( const char *q1 ){
	int idx;
	while ( q1[idx] ){
		idx++;
	}//计数菌阵亡系列~ 
	return idx;
}
