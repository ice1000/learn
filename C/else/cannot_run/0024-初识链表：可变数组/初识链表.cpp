#include "node.h"
#include <stdio.h>
#include <stdlib.h>

/*typedef struct{
	node* head;
	node* tail;
} list ;*/

/*typedef struct node_{
	int num;//值。 
	struct node_ *next;
} node ;*/

//void函数add:输入函数。 便于修改指针。 
//void csh( list* lst) 初始化函数。 

int main(void){
	
	list lst;
//整个链表 
	int number = 0, j;
//node *head = NULL;

	csh(&lst);

	printf("这是一个链表程序。输入数组，一个数字一个回车。\n输入-1结束。-1不会计入数据中。\n"); 

	do{
		printf("请输入。\n");
		scanf("%d",&number);
		if( number != -1 ){
			add( &lst, number );
		}
	}while ( number != -1 );

//用if避免将-1输入。 

	printf("输入已结束。\n");

	printf("head=%d\ntail=%d\n",*(lst.head),*(lst.tail));

	printf("thanks for using my program.\n\n\n\n                   ——ice1000 千里冰封\n\n\n");
	system("pause");
	return 0;

}

void csh( list* lst){
	lst->tail = lst->head = NULL;
}

void add( list* biao, int new_value ){

	node *h = biao->head;
	node *t = biao->tail;
//先用简单的字母表示他们。 

	t = ( node* )malloc( sizeof(node) );
//申请空间 
	t->num = new_value;
//赋值。 

	if( t == NULL ){
//第一个的情况。
		h->num = new_value;
		h = t;
	};

	t = t->next;//移位。
	t->next = NULL;
	
	biao->head = h;
	biao->tail = t;
//表示回来。 
}
/*
void add (list* pList,int number){
    node *p = (node*) malloc (sizeof(node));
    p -> num = number;
    p -> next = NULL;
    p->back = NULL;
    if (pList -> tail){
        pList->tail->next = p;
        p->back = pList->tail;
        pList->tail = p;
    } else {
        pList->tail = p ;
        pList->head = p ;
        p->back = NULL;
    }
}
*/
