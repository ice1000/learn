#include<stdio.h>
#include<stdlib.h>

int main(){
	int x=0;
	float i=0.0000;
	int t=0;
	
	printf("input the number.\n");
	scanf("%d",&x);
	
	for( t=1;t<=x;t++) {
	i+=1.0000/t;
	}
	
	printf("\nf(%d)=%f\n",x,i);
	
	printf ("thanks for using my program.\n\n\n\n                   ¡ª¡ªice1000 Ç§Àï±ù·â\n\n\n");
	system("pause");
	return 0;
} 
