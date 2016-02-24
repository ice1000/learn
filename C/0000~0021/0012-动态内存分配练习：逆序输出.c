#include <stdio.h>
#include <stdlib.h>

int main(void){
	int a,b;
	int *p;//把它当数组来用。 
	
	printf("您要输入多少个字符呢？\n"); 
	printf("每输入一个字符要回车一个哦~\n");
	scanf("%d",&a);
	printf("好的，请开始输入您的字符~\n千万不要超量哦~\n不然我会崩溃的~\n");
	
	p=(int*)malloc((a)*sizeof(int));//相当于申请了一个可变数组。 
	
	for ( b=0; b<a; b++ ){
		scanf("%d",&p[b]);
	}
	
	for ( b=--a; b>=0; b--){
		printf("%d",p[b]);
	}
	
	free(p);
} 
