#include <stdio.h>
#include <stdlib.h>

int main () {
	
	printf("这个程序告诉我们电脑中存储数据并不是绝对标准的。\n");
	printf("0.0001234554321123e-20=%.80f\n",0.0001234554321123e-20);

//这里用科学计数法表示的浮点字面量在存储时会产生误差，碉堡！
	printf("\nthanks for using my program.\n\n\n\n                   ——ice1000 千里冰封\n\n\n");
	system("pause");

return 0;
}
