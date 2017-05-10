//#include "array.h"
#include <stdlib.h>
#include <stdio.h>

typedef struct {
	int *ary;
	int size;
} ary ;

ary ary_crt( int in_size ){
	ary a;

	a.size = in_size;
	a.ary = (int*)malloc( in_size * sizeof(int) );

	return a;
}//创造一个数组。还是本地变量，好。


void ary_fre( ary *a ){
	free(a->ary);
	a->ary = NULL;
	a->size = 0;
}//释放！ 


int ary_size( const ary *a ){

	return a->size;
}//封装 


void ary_flt( ary *a, int mrsz ){
	int *p = (int*)malloc( sizeof(int) * ( a->size + mrsz ) );
	//重新申请一块变量。 
	int i;
	for( i=0; i<a->size; i++ ){
		p[i] = a->ary[i];
	}//重新赋值，。 

	free(a->ary);//释放原来的。 

	a->ary = p;
	a->size += mrsz;
}//自动增长。


int* ary_at( ary *p, int index ){
	while( index > p->size ){
		ary_flt( p, 50 );//增长。 一次50个。 
		p->size = index +1; 
	}

	return &(p->ary[index]);
}//返回值可以直接赋值,相当于 


int main(void){
	printf("可变数组程序，这个程序毫无意义，但是代码很高级。\n");
	printf("thanks for using my program.\n\n\n\n                   ——ice1000 千里冰封\n\n\n");
	system("pause");
	return 0;
}
