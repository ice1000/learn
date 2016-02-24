#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int judge( int heng,int zong ); //这个函数是这个程序的所有精髓，主函数只是框架。 

int cishu=1; //这些变量本来是放函数里的，但是为了能够一直引用就弄全局变量了。 
int result = -1; //-1:没人赢, 0 : o赢, 1 : x赢，2：流局。 
const int size=3;//棋盘的大小 
char board[size][size]={
	{'-','-','-'},
	{'-','-','-'},
	{'-','-','-'},
	}; 

int main(void) {
	
	printf ("欢迎使用冰封写的井字棋。\n\n");
	printf ("-\t-\t-\n\n\n-\t-\t-\n\n\n-\t-\t-\n\n\n");
	
	int heng = 0,zong = 0,guichu=0;
	int hege=1;//只有这个为0时才将输入放进坐标。

	printf("输入您的棋子坐标。格式：\n\n【横坐标】,【纵坐标】\n\n横坐标是从左往右，纵坐标是从上往下。\n\n注意逗号不要打掉了哦\n\n\n\n"); 
	
		while ( hege == 1 ) {
			
			printf("\n等着您的输入呢~\n"); 
			scanf ("%d,%d",&heng,&zong);
		
			if ( heng > 3 || zong > 3 ) {
				printf ("\n\n诶诶，井字棋不是只有三格吗~重新来哦~\n\n"); 
				continue;
			}	else if ( heng < 1 || zong < 1 ){
				printf ("\n\n行行，你是数学帝，请输入正整数~\n\n");
				continue;
			}	else {
				hege = 0;//判断输入合格。 
			}
			
			result = judge(zong ,heng);	
			
			switch ( result ) {	
					
				case -1:
					zong = heng = 0;
					hege =1;
					break;
		
				case 0:
					printf("\t");
					for( guichu = 0 ; guichu < 80 ; guichu ++ ){
						printf ("恭喜!!\n恭喜 O 方获得胜利！！！ 游戏结束~");
						if ( guichu%10 == 0 ){
							printf("\n");
						}
					}
					break;
				case 1:
					printf("\t"); 
					for( guichu = 0 ; guichu < 80 ; guichu ++ ){
						printf ("恭喜!!\n恭喜 X 方获得胜利！！！ 游戏结束~");
						if ( guichu%10 == 0 ){
							printf("\n");
						}
					}
					break;
				case 2:
					printf("\t\n");
					printf("流局。。看来二人势均力敌啊。^^\n");
					break;
				defult :
					printf("抱歉呢，貌似出了一点小问题~");//这行字估计永远无法输出，不过以防万一其它程序入侵。。 
					break;
		}
	}
	
	printf ("thanks for using my program.\n\n\n\n                   ——ice1000 千里冰封\n\n\n");
	
	system("pause");
	
	return 0;
}

int judge ( int heng , int zong ) {
	
	heng --; zong --;
	
	if ( board[heng][zong] == 'O' || board[heng][zong] == 'X' ){
		
		printf("\n诶诶，这一格已经被占领啦~重新输入吧~\n");
		return (-1);
	} 
	
	if ( cishu % 2 == 1 ){
		board[heng][zong] = 'O';
	}	else {
		board[heng][zong] = 'X';
	}

	int i,j; //i是行，j是列。

	printf ("\n\n\n\n\n\n\n\n");
	for ( i=0; i<size ;i++ ) {
		for( j=0; j<size ;j++ ){
			printf("%c\t", board[i][j]);
		}
		printf("\n\n\n");
	}
	//输出完成之后就开始了超级复杂的判断胜负过程~~
	
	//列优先
	for ( j=0; j<size; j++ ) {

		if ( board[0][j] == board[1][j] && board[1][j] == board[2][j] ){

			//到这里时胜负已定，只需判断胜者是谁。 
			
			if ( board[1][j] == 'O' ) {
				result = 0;
			} else if ( board[1][j] == 'X' ) {
				result = 1;
			}	//不用说这里肯定是board[0][j] == 'X'的情况~ 
		}
	}
	
	//行靠边 
	for ( i=0; i<size; i++ ) {
		
		if ( board[i][0] == board[i][1] && board[i][1] == board[i][2] ){
			
		//到这里时胜负已定，只需判断胜者是谁。
			
			if ( board[i][1] == 'O' ) {
				result = 0;
			} else if ( board[j][1] == 'X' ) {
				result = 1;
			}	//不用说这里肯定是board[i][0] == X的情况~ 
		}
	}
	
	//现在是斜着的判断。
	if ( board[0][0] == board[1][1] && board[1][1] == board[2][2] ){		

		//到这里时胜负已定，只需判断胜者是谁。
	
		if ( board[0][0] == 'O' ) {
			result = 0;
		} else if ( board[0][0] == 'X' ) {
			result = 1;
		}	//不用说这里肯定是board[i][0] == X的情况~ 
	}
	
	if ( board[2][0] == board[1][1] && board[1][1] == board[0][2] ){
		
		//到这里时胜负已定，只需判断胜者是谁。
		
		if ( board[1][1] == 'O' ) {
			result = 0;
		} else if ( board[1][1] == 'X' ) {
			result = 1;
		}	//不用说这里肯定是board[i][0] == X的情况~ 	
	}
	
	switch ( board[heng][zong] ) {
		case 'O':
			printf("\n现在请 X 下棋~\n");
			break;
		case 'X':
			printf("\n现在请 O 下棋~\n");
			break;
		defult  :
			break;
	}

//特别说明，当两个if都不满足时，就是还没有下、棋盘空出来的情况，这时result还是等于-1. 
	
	cishu ++ ;
	
	if ( cishu == 10 ) {
		printf("\n最后一局呢，决定性的一刻！\n");
		if ( result == -1 ){
		result = 2 ;
		}
	}
	
	return (result);
}

