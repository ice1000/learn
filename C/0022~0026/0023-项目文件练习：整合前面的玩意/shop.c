#include <stdio.h>
#include <stdlib.h>

void shop(void){
    char choice;
    int i,j,m,n,o,a=0,b=0,c=1,last=0;
    //a、b是循环专用，c是用来退出的，last是用来计算商品数量的，i在43，44行昙花一现.
	static char instruction[1001][2][500]={'\0'};//1000件商品，500字名称，500字介绍，空间充足。
    static int pricequantity[1001][2]={'\0'};//1000件商品，第零个是价，第一个是剩余量。
 

	system("color 4f");

    printf("欢迎进入商店管理系统。\n");
    printf("e:退出\t\tn:增加新物品\ns:访问已有物品\tb:购买物品\na:进货\np:再看一遍(务必记住这条，免得忘记指令。)\n");

	while ( c == 1 ){

		printf("想要做什么？\n");

		scanf("\n%c",&choice);

		switch( choice ){
			
			case 'p':
				printf("e:退出\t\tn:增加新物品\ns:访问已有物品\tb:购买物品\na:进货\np:再看一遍(务必记住这条，免得忘记指令。)\n");
				break;
			
  	    	case 'e':

				c=2;
				choice='\0';

				break;
  	      	
			case 'n':
				
				last ++;//下一次输入商品时就存放在另一个空间啦~ 
    	        printf("新物品 名称:(结束输入请输入#)\n");

				for(a=0;a<500;a++){
     	       		scanf("%c",&instruction[last][0][a]);
     		       	if (instruction[last][0][a] == '#'){
            			instruction[last][0][a] = '\0';
						break;
					}
				}

				printf("新物品 介绍：(结束输入请输入@)\n(请控制在500字以内，不然程序会崩溃。)\n");

				for(a=0;a<500;a++){
        	    	scanf("%c",&instruction[last][1][a]);
        	    	if (instruction[last][1][a] == '@'){
            			instruction[last][1][a] = '\0';
						break;
					}
				}

				printf("新物品 价格:");
				scanf("%d",&pricequantity[last][0]);

				printf("\n知道了。记得进货哟~亲~\n");
				
				
				choice='\0';
				
				break; 
	        
			case 's':
	        	
				printf("好的，下面是目前已经有的商品：\n");

				for(a=0;a<last;a++){
	        		i=a+1;
	        		printf("%d号商品名称：",i);
	        		
					for(b=0;b<500;b++){
						if(instruction[i][0][b] == 0 &&instruction[i][0][b++] == 0){
							break;
						}
	        			printf("%c",instruction[i][0][b]);
					}

					printf("\n介绍：");

					for(b=0;b<500;b++){
						if(instruction[i][1][b] == 0 &&instruction[i][1][b++] == 0){
							break;
						}
	        			printf("%c",instruction[i][1][b]);
					}
					
					printf("\n价格:%d",pricequantity[i][0]);
					printf("\n剩余数量:%d件",pricequantity[i][1]);

					printf("\n\n");
				}
				choice='\0';
				break;

    	    case 'b':
    	    	
				printf("请输入要购买的物品编号：\n");
				scanf("%d",&j);
				
				printf("您要购买的物品是：");
				
				for(a=0;a<500;a++){
					
					if( instruction[j][0][a] == 0 &&instruction[j][0][a++] == 0 ){
						break;
					}
					printf("%c",instruction[j][0][a]);
				
				}
				
				printf("\n这是一件很棒的商品哦~\n请看卖家介绍~\n");
				
				for(a=0;a<500;a++){
					
					if( instruction[j][1][a] == 0 &&instruction[j][1][a++] == 0 ){
						break;
					}
					printf("%c",instruction[j][1][a]);
				}
				
				printf("\n哦~心动了吗？心动了就赶紧买吧！");
				printf("\n价格：%d,\n剩余：%d件。\n",pricequantity[j][0],pricequantity[j][1]);
				
				printf("您要买多少件呢？");
				
				scanf("%d",&m);
				
				if( m>pricequantity[j][1] ){
					printf("抱歉呢，库存不足~\n");
				}else{
					printf("好的！一共是%d元~商品已售出~",pricequantity[j][0]*m);
					
					pricequantity[j][1] -= m;
					
					printf("\n还剩%d件哦。\n",pricequantity[j][1]);
				} 

     	   		choice='\0';
     	   		break;
    	    
			case 'a':
    	    	
    	    	printf("请输入商品编号~\n");
				scanf("%d",&n);
				
				printf("您要进货的商品是：");
				
				for(a=0;a<500;a++){
					
					if( instruction[n][0][a] == 0 &&instruction[n][0][a++] == 0 ){
						break;
					}
					printf("%c",instruction[n][0][a]);
				
				}
				
				printf("进货多少件呢？\n");
				scanf("%d",&o);
				
				pricequantity[n][1] += o;
				
				printf("进货完成~\n");

    	    	choice='\0';
    	    	break;
    	    
			default:
    	    	
				printf("\n不对呢~重新输入哦?\n");
    	    	choice='\0';
    	    	
				getchar();
				break;
		}

	}
	
	printf("谢谢使用。\n");
	printf ("thanks for using my program.\n\n\n\n                   ——ice1000 千里冰封\n\n\n");
	
	puts("哦？这就完了？好吧~\n商店系统欢迎您的下次使用~\n");
	
	system("pause");
}

