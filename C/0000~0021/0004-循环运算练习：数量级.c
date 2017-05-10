#include <stdio.h>
#include <stdlib.h>

int main()
{
	int n=0;
	long x=0;
	
	printf("write your number here:\n");
	scanf("%d",&x);
	
	while (x>0) {
		n++;
		x/=10;
	}
	
	printf("\nIt has got %d numbers,right?\n",n);
	
	printf ("thanks for using my program.\n\n\n\n                   ¡ª¡ªice1000 Ç§Àï±ù·â\n\n\n");
	system("pause");
	return 0;
}
