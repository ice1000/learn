#include <stdio.h>
#include <stdlib.h>

int main(int argc,char** argv)
{
	int
	hour1,minute1,
	hour2,minute2;
	
	printf("\nWrite the two times,hour first,minute second.(without 小数点)\n"); 
	printf("examples:\n 3:10,2:30 回车\n");
	scanf("%d:%d",&hour1,&minute1);
	scanf(",%d:%d",&hour2,&minute2);
	
	int t1=hour1*60+minute1,t2=hour2*60+minute2;
	int t=t2-t1;
	
	printf("\nthe Δ of the two times is %d hour(s) %d minute(s)\n",t/60,t%60);
	
	printf ("thanks for using my program.\n\n\n\n                   ——ice1000 千里冰封\n\n\n");
	system("pause");
	
	return 0;
}
