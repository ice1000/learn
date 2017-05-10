#include <stdio.h>
#include <math.h>
#include <stdlib.h>

int isprime(int num);

void primelist(void){
	
	int aa,bb;
	
	printf("\n您要生成多少个质数的表？\n");
	scanf("%d",&aa);
    system("pause");
	 
	int *a; 
	
	bb=aa+1;
	
	a=(int*)malloc(bb*sizeof(int));//动态内存分配哈哈！！ 
	
	int i=2,k=0,situation=1,qwe;
	
	while ( situation <= aa ) {//把以前的for改成了while! 

		k=i;
		qwe=isprime(k);
		
		if ( qwe == 1 ) {
			
			printf("找到了！%d是质数！",i);
			a[situation] = i;
			
			if( i%3 == 0 ){
				printf("\n");
			}
			
			situation ++;
			} 
	i++;	
	}
	
	k = qwe = 0;//一寸变量一寸金，k和qwe没有用之后就初始化了挪作他用吧~ 
	
	printf("\n\n\n\n\n\n\n终于找完了，看我快不快？哈哈哈O(∩_∩)O~\n\n");
    printf("吼吼~现在开始为您生成一张质数表！\n");
	
	system("pause");
	
	for ( k=1; k<=aa; k++ ){
	
	    if	( a[k] != 0 ) {
		
		    printf("%d\t",a[k]);
		
		    if ( k % 10 == 0 ){
			
			    printf("\n");
		
		}
		
		} else {
		
		printf("\n\n\n");
		break;
		              //在丢失数据时停止输出，退出循环。不过在改进后就没有用了。 
		}
		
	} 
	
	printf("\nthanks for using my program.\n\n\n\n                   ——ice1000 千里冰封\n\n\n");
	system("pause");
	
	free(a);//有借有还~ 

}

int isprime(int num){

   int q,isprime=1;
   long int x=num;
   
      for( q=2;q<=sqrt(num);q++){
      long int x=num;
      x %= q;
      
         if( x==0 ){
         
         isprime=0;
         break;
         
         }
         // 如果是质数就返回 isprime=1,如果是合数就返回 isprime=0. 
      }
   return (isprime);
}
