#ifndef _ARRAY_H_
#define _ARRAY_H_

typedef struct {
	int *ary;
	int size;
} ary ;

ary ary_crt( int in_size );//创造 
void ary_dlt( ary *a );//删除 
int ary_size( const ary *a );//查看大小 
int* ary_at( ary *p, int index );//访问数组中的玩意。安全版。 
void ary_flt( ary *a, int mrsz );//成长！ 

#endif
