#include <stdio.h>
#include <stdlib.h>
 
typedef struct _node{
    int value;
    struct _node* next;
    struct _node* back;
}Node;
 
typedef struct _list{
    Node* tail;
    Node* head;
}List;
 
void add (List* pList,int number);
void delet (List *pList , int number);
void print ( List list );
int main (int argc , char const * argv[]){
    List list;
    int number;
    int num;
    list.head=list.tail=NULL;
    do{
    	puts("ÇëÊäÈë¡£\n");
        scanf ("%d",&number);
        if (number != -1){
            add(&list,number);
        }
    }while ( number != -1);
    print (list);
    scanf ("%d",&num);
    delet (&list,num);
    print (list);
    return 0;
}
 
void add (List* pList,int number){
    Node *p = (Node*) malloc (sizeof(Node));
    p -> value = number;
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
 
void delet (List *pList , int number){
    Node *p ;
    for ( p = pList->head ; p ; p = p->next){
        if ( p->value == number){
            if(p != pList->head && p != pList->tail){
                p->back->next = p->next;
                p->next->back = p->back;
             
            }
            if ( p == pList->head ){
                pList->head = p->next;
                  
             
            }
            if ( p == pList->tail){
                pList->tail = p->back;
                p->back->next = NULL;
                 
            } 
            free (p);
            break;
        }
         
    }
}
 
void print ( List list ){
    Node *p  ;
    for ( p = list.head  ; p ; p = p->next){
        printf ( "%d\t",p->value); 
        }
    printf ("\n");
}

