#include<stdio.h>

int isprime(long int num); 

int main(){

   
   long int aa=0;
   
   while ( 1==1 ){
   
	   printf ("\n\n           欢迎使用质数判断系统。\n");
	   printf ("           你想确认什么数？\n");
	   
	   scanf("%d",&aa);
	   
	   int yiju=isprime(aa);
	   
	   if (yiju){ printf("\n\n是质数\n\n");}
	   else {printf("\n\n是合数\n\n");}
	   
   }
   return 0;
}


int isprime(long int num){

   int a,isprime=1;
   long int x=num;
   
      for( a=2;a<num;a++){
      long int x=num;
      x %= a;
      
         if( x==0 ){
         
         isprime=0;
         break;
         
         }
         
      }
   return (isprime);
}
