#include <stdio.h>
#include <stdlib.h>

int main(void){
	char p1[100] = {'\0'};
	const char* p2 = (char*)malloc(100*sizeof(char));
	
	printf("sizeof(p1) = %d\n",sizeof(p1));
	printf("sizeof(p2) = %d\n",sizeof(p2));
	
	system("pause");
	
	return 0;
}
