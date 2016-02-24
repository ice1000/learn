#include <stdio.h>
#include <stdlib.h>

struct date {

	int year;
	int month;
	int day;

};

int main(int argc, const char *argv[]){
	struct date thisday;
	struct date today;
	
	thisday = (struct date){2015,6,9};
	
	printf("欢迎使用本日期程序。请输入今天的日期\n格式：年-月-日 然后回车\n");
	scanf("%d-%d-%d",&today.year,&today.month,&today.day);
	
	printf("\n这个程序来自%d-%d-%d\n",thisday.year,thisday.month,thisday.day);
	
	if ( today.year%4 == 0 && today.year%400 != 0 ){
		printf("哇哦，今年还是闰年呢~");
	} else {
		printf("今年的2月份只有28天吧。。不是闰年。。。"); 
	}
	printf("\n");
	printf("时隔%d年之久，这个程序竟然又被挖掘出来\n作为程序员的冰封好兴奋啊~~\n",today.year-thisday.year);
	printf("说实话，我拿到“结构”这个玩意时，都不知道该写些怎样的程序\n");
	printf("所以呢，就无聊一下~\n");
	
	printf("thanks for using my program.\n\n\n\n                   ——ice1000 千里冰封\n\n\n");
	system("pause");
	return 0;
 }
