#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main()
{
	int count=30;
	
	printf("»ð¼ý·¢Éä30Ãëµ¹¼ÆÊ±£º\n");
	system("pause");
	
	do {
		printf("%d\n",count--);
		sleep(1);//¸ßµµÓï¾ä~ 
	} while (count>0); 

	
	while (count<10) {
		count++;
	    printf("·¢Éä!!!\n  hiahia\n");
    }	
	
	printf ("thanks for using my program.\n\n\n\n                   ¡ª¡ªice1000 Ç§Àï±ù·â\n\n\n");
	system("pause");
	return 0;
 } 
