/*

#include<stdio.h>

int i = 0;

void f(int a,char c1,char c2,char c3){
	
	if(i==a){
		return;
	}
	
	printf("%c->%d->%c\n",c1,i+1,c3);
	f(a-1,c1);
	printf("%c->%d->%c\n",c1,i+2,c2);
	printf("%c->%d->%c\n",c3,i+1,c2);
	
	
}

int main(void){
	char c1,c2,c3;
	int a;
	
	scanf("%d %c %c %c",&a,&c1,&c2,&c3);
	
	f(a,c1,c2,c3);
	
	return 0;
}

*/

#include <stdio.h>

int i=1;
void move(int n,char from,char to) 
{
	printf("%c->%d->%c\n",from,n,to);
	i++;
}

void hanoi(int n,char from,char denpend_on,char to)
{
    if (n==1)
    move(1,from,to);
	else
	{
      hanoi(n-1,from,to,denpend_on);
	  move(n,from,to);              
	  hanoi(n-1,denpend_on,from,to);
	}
}

int main(void)
{
   	char c1,c2,c3;
	 int n;
	 scanf("%d %c %c %c",&n,&c1,&c2,&c3);
	 hanoi(n,c1,c3,c2);
	 return 0;
}
