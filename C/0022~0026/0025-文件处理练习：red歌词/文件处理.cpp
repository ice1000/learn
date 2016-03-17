#include <stdio.h>
#include <stdlib.h>
#define lines 38  //文件的总行数。 

int main(void){
	FILE *fp = fopen( "C:\\Users\\asus1\\Desktop\\The C Programming Language\\0022~0026整合包\\0025-文件处理练习：red歌词\\输入文件\\a.in","r" );//打开只读。
	FILE *ffp= fopen( "C:\\Users\\asus1\\Desktop\\The C Programming Language\\\其他\\资源\\文件输入整合\\工口\\b.txt","r" );
	if( fp&&ffp ){
		char i='\0';
		
		puts("文件已成功打开。O(∩_∩)O哈哈~\n"); 
		puts("按a显示文件内容~");
		scanf("%c",&i);
		switch( i ){
			case 'h'://神秘代码 
			case 'H':
				char text[60000];//保险。
				system("color e3");
				int a,b;
				fgets( text, 60000, ffp );
				for( a=0; a<59999; a+=600){
					for( b=0; b<600; b++){
						printf("%c",text[a+b]);
					}
				printf("\n\n");
				system("pause");
				printf("\n");
				}
				break;
			case 'a':
			default:
				fgets( text, 2000, fp );//第一个是字符串指针，第二个是最大字数，第三个是文件指针。
				printf( "%s\n", text );
			break;
		}
		fclose(ffp);
		fclose(fp);
	}else{
		puts("无法打开指定文件。\n");
	}
	
	
	printf("thanks for using my program.\n\n\n\n                   ——ice1000 千里冰封\n\n\n");
	system("pause");
	return 0;
 } 
