#ifndef _NODE_H_
#define _NODE_H_

typedef struct node_{
	int num;
	struct node_ *next;
} node ;

typedef struct{
	node* head;
	node* tail;
} list ;

void csh( list* );//初始化 
void add( list* phead, int new_value );//增加。 
//void add (list* pList,int number);

#endif
