#include<stdio.h>
#include<stdlib.h>

int main(void){
	int i,j=0,a[3][3]={0}; 
	printf("input\n");
	for(i=0;i<3;i++){
		scanf("%d,%d,%d",&a[i][0],&a[i][1],&a[i][2]);
	}
	for(i=2;i>=0;i--){
		for(j=2;j>=0;j--){
			printf("%d,",a[i][j]);
		}
	printf("\n");
	}
	system("pause");
} 
