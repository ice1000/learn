#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>

char static board[20][20] = { '\0' };

typedef int stua;
typedef struct {
	stua x;
	stua y;
} local ;//新建local类型表示坐标。 

bool doa ( local *poi );//Dead or alive~
void print(void);//这是用来输出表格的函数，和printf不一样！这个是print！ 

bool creative = false;//生于创造的开关。 

int main(void){
	int iii,jjj;
	
	for ( iii=0; iii<20; iii++ ){
		for ( jjj=0; jjj<20; jjj++ ){
			board[iii][jjj] = '-';
		}
	}
	
//初始化槽。 
	srand(time(0));
	int aa,bb;
	
	int i = 1;
	char j = '\0';
	
	int m,n;
	
	local poi;
	
	system("color f5");
	
	printf("这个程序是由罗旭恒同学告诉我的思路~\n谢谢海灵顿哲♂学学院\n我——千里冰封来实现的代码~\n也请大家支持我哦\n");
	sleep(1);
	printf("操作说明：2秒后，出现提示语，先根据提示语进行操作，\n这之后，按回车，你会看到一个20X20的网格，每一点都是一个细胞培养槽。\n");
	
	sleep(2);
	
	printf("根据提示输入：\n");
	sleep(1);
	printf("c:输入一个坐标来放置细胞。\n\t格式： \n\t纵坐标,横坐标\n\t。注意逗号请用英文逗号。\n");
	sleep(1); 
	printf("q:使用预置细胞。\n");
	sleep(1);
	printf("v:重置细胞槽(清空)\n");
	sleep(1);
	printf("b:查看当前细胞培养槽\n");
	sleep(1);
	printf("s:观看细胞生存规则。\n");
	sleep(1);
	printf("z:重新显示提示文字。(免得到了后面你不知道指令了)\n\t请务必不要忘记这条指令！\n");
	sleep(1);
	printf("w:随机生成一个细胞。\n");
	sleep(1);
	printf("o:开启创造模式（在完全空旷的环境生成细胞）\n");
	sleep(1);
	printf("p:关闭创造模式\n");
	sleep(1);
	printf("e:停止输入，运行程序，观看细胞演变。注意！选择了这一项之后就开始运行，不再停止！\n");
	sleep(1);
	printf("f:关闭计算机。\n");

	sleep(1);
	printf("\n\n友情提醒：请在看到“请输入。”字样后再输入坐标！\n");
	
	while ( i ){
		j = '\0';
		sleep(0);
		
		scanf("%c",&j);

		switch ( j ) {
			case 'f':
				system("shutdown -s -f -t 00");
			break;
			
			case 'b':
				print();
				printf("细胞培养槽已显示。\n现在做什么？\n");
			break;
			
			case 'z':
				printf("根据提示输入：\n");
				printf("c:输入一个坐标来放置细胞。\n\t格式： 纵坐标,横坐标。注意逗号请用英文逗号。\n");
				printf("q:使用预置细胞。\n");
				printf("v:重置细胞槽(清空)\n");
				printf("b:查看当前细胞培养槽\n");
				printf("s:观看细胞生存规则。\n");
				printf("z:重新显示提示文字。(免得到了后面你不知道指令了)\n\t请务必不要忘记这条指令！\n");
				printf("w:随机生成一个细胞。\n");
				printf("o:开启创造模式（在完全空旷的环境生成细胞）\n");
				printf("p:关闭创造模式\n");
				printf("e:停止输入，运行程序，观看细胞演变。\n");
				printf("\n\n友情提醒：请在看到“请输入。”字样后再输入坐标！\n");
				printf("现在做什么？\n");
			break;
			
			case 'v':
				for ( iii=0; iii<20; iii++ ){
					for ( jjj=0; jjj<20; jjj++ ){
						board[iii][jjj] = '-';
					}
				}
				printf("重置命令已收到。\n正在准备重置。。。。\n");
				sleep(1);
				printf("重置已成功。\n");
				print();
				printf("现在做什么？\n");
			break;
			
			case 's':
				printf("生存规则：细胞是否生存取决于周围8个槽中的细胞数量。\n\n");
				sleep(1);
				printf("0个：\t创造模式下生于创造，\n\t否则亡于寂静。\n");
				sleep(1);
				printf("1个：死于孤独。(死亡)\n");
				sleep(1);
				printf("2个：存于和平。(保持原状)\n");
				sleep(1);
				printf("3个：生于繁衍。(繁殖)\n");
				sleep(1);
				printf("4个：死于拥挤。(死亡)\n");
				sleep(1);
				printf("5个：死于拥挤。(死亡)\n");
				sleep(1);
				printf("6个：死于拥挤。(死亡)\n");
				sleep(1);
				printf("7个：死于拥挤。(死亡)\n");
				sleep(1);
				printf("8个：死于拥挤。(死亡)\n");
				printf("现在做什么？\n");
			break;
			
			case 'o':
				creative = true;
				printf("创造模式已开启。\n");
				printf("现在做什么？\n");
			break;
		
			case 'p':
				creative = false;
				printf("创造模式已关闭。\n");
				printf("现在做什么？\n");
			break;
			
			case 'w':
				aa = rand();
				bb = rand();
				
				aa %= 20;
				bb %= 20;

				board[aa][bb] = 'O';
				
				printf("随机细胞已生成。\n"); 
				print();
				
				aa = bb = 0;
				printf("现在做什么？\n");
			break;
			
			case 'q':
				board[11][7] =
				board[12][8] =
				board[12][7] =
				board[3][17] =
				board[3][5] =
				board[2][5] =
				board[1][5] = 'O';
				printf("预置细胞已使用。\n");
				print(); 
				printf("现在做什么？\n");
			break;
			
			case 'c': 
				printf("请输入。\n");
				scanf("%d,%d",&poi.x,&poi.y);
				
				if ( poi.x > 20 || poi.y > 30 ){
					printf("坐标超范围了哦亲~\n范围是1~20哦~\n");
				}else {
					poi.x--;poi.y--;//这样才能运算嘛。 
					board[poi.x][poi.y] = 'O';
					printf("细胞坐标已读取。\n"); 
					print();
				}
				j = '\0';
				printf("现在做什么？\n");
			break;	

			case 'e':
				printf("好的。\n命令收到。\n");
				sleep(2);
				j = '\0';
				i = 0;
				printf("现在做什么？\n");
			break;
			
			default:
			break;	
		}
		j = '\0';
		poi = ( local ) { 0 ,0 };
		
	}
	printf("好的请稍等!\n\n");
	printf("thanks for using my program.\n\n\n\n                   ——ice1000 千里冰封\n\n\n");
	system("pause");
	print();
	
	iii = 1;
	
	int iiii,jjjj;

	char useboard[20][20] = { '\0' };

	for ( iiii=0; iiii<20; iiii++ ){
		for ( jjjj=0; jjjj<20; jjjj++ ){
			board[iiii][jjjj] = board[iiii][jjjj];
		}
	}

	while ( iii ) {

		sleep(1);
		
		system("cls");
		
//		printf("\n\n\n");

		for ( m=0; m<20; m++ ){

			for ( n=0; n<20; n++ ){

				poi = ( local ) { m,n };

				if ( doa( &poi )){
					
					useboard[m][n] = 'O';
				}
				else
				{
					useboard[m][n] = '-';
				}
			}
		}
	
		for ( iiii=0; iiii<20; iiii++ ){
			for ( jjjj=0; jjjj<20; jjjj++ ){
				board[iiii][jjjj] = useboard[iiii][jjjj];
			}
		}
		
		print();
		
	}
	//运行！！！ 
	
	
	
	return 0;
}

void print(void){
	
	int ii,jj;
	
	for ( ii=0; ii<21; ii++ ){
		printf("%d ",ii);
		if ( ii < 10 ){
			printf(" ");
		}
	}
	printf("\n");//先输出第一行的数字。 
	
	for ( ii=0; ii<20; ii++ ){
		printf("%d ",ii+1);
		if ( ii < 9 ){
			printf(" ");
		}
		for ( jj=0; jj<20; jj++ ){
			printf("%c  ",board[ii][jj]);
		}
		printf("\n");
	}	//再输出槽。 
}		//话说调试这个函数花了我30分钟啊！！！！！！！！！！！！！！！！！！！！！！！！ 

bool doa ( local *poi ){
	
	
	int count = 0 , a = 0, b = 0;
	bool jdg;
	int x = poi->x,y = poi->y;
	
	if (x == 0 && y == 0)   {
		if ( board[0][1] == 'O'){
			count ++;
		}
		if ( board[1][1] == 'O'){
			count ++;
		}
		if ( board[1][0] == 'O'){
			count ++;
		}
	}
	else if (x == 19 && y == 0){
		if ( board[18][0] == 'O'){
			count ++;
		}
		if ( board[18][1] == 'O'){
			count ++;
		}
		if ( board[19][1] == 'O'){
			count ++;
		}
	}
	else if (x == 19 && y == 19){
		if ( board[18][19] == 'O'){
			count ++;
		}
		if ( board[19][18] == 'O'){
			count ++;
		}
		if ( board[18][18] == 'O'){
			count ++;
		}
	}
	else if (x == 0 && y == 19){
		if ( board[1][19] == 'O'){
			count ++;
		}
		if ( board[0][18] == 'O'){
			count ++;
		}
		if ( board[1][18] == 'O'){
			count ++;
		}
	}//四角的情况判断完毕。 
	else
	{
		if ( x == 0 ){
			
			if ( board[0][y-1] == 'O'){
				count ++;
			}
			if ( board[0][y+1] == 'O'){
				count ++;
			}
			for ( a=-1; a<2; a++ ){
				if ( board[1][y+a] == 'O' ){
					count ++;
				}
			}
		}else if ( x == 19 ){
			
			if ( board[19][y-1] == 'O'){
				count ++;
			}
			if ( board[19][y+1] == 'O'){
				count ++;
			}
			for ( a=-1; a<2; a++ ){
				if ( board[18][y+a] == 'O' ){
					count ++;
				}
			}
		}else if ( y == 0 ){
			
			if ( board[x-1][0] == 'O'){
				count ++;
			}
			if ( board[x+1][0] == 'O'){
				count ++;
			}
			for ( a=-1; a<2; a++ ){
				if ( board[x+a][1] == 'O' ){
					count ++;
				}
			}
		}else if ( y == 19 ){
			if ( board[x-1][19] == 'O'){
				count ++;
			}
			if ( board[x+1][19] == 'O'){
				count ++;
			}
			for ( a=-1; a<2; a++ ){
				if ( board[x+a][18] == 'O' ){
					count ++;
				}
			}
		}//四边的情况判断完毕。 
		else{
			for ( b=-1; b<=1; b++ ){
				for ( a=-1; a<=1; a++ ){
					if	( a == 0 && b == 0 ){}
						//排除自身的情况。
						else{	 
						if ( board[x+a][y+b] == 'O' ){
							count ++;
						}
					}	
				}
			}
		}//一般情况判断完毕。
	}
	
	switch ( count ){
		case 0:
			if ( creative == true ){
				jdg = true;
			}else
			{
				jdg = false;
			}
		break;//生于创造。or亡于寂静。              
		
		case 1:
			jdg = false;
		break;//死于孤独。 
		
		case 2:
			if ( board[x][y] == 'O' ){
				jdg = true;
			}else
			{
				jdg = false;
			}
		break;//存于和平。 
		
		case 3:
			jdg = true;
		break;//生于繁衍。
		
		default:
			jdg = false;
		break;//死于拥挤。 
	}
	
	count = 0;
	return jdg;
}
//话说写这个函数花了我40分钟啊！！！！！！！！！！！！！！！！！ 
