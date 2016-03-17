#include <stdio.h>
#include <stdlib.h>

void shop (void){
	typedef struct{
		char name[50];
		char instruc[500];
		int price;
		int quant;
	}item;

    char choice;
    int i,j,m,n,o,a=0,b=0,c=1,last=0;
    //a、b是循环专用，c是用来退出的，last是用来计算商品数量的，i在43，44行昙花一现. 
    item num[1000]={'\0'};//1000件商品，50字名称，500字介绍，空间充足。

	system("color 4f");

    printf("欢迎进入商店管理系统。\n");
    printf("e:退出\t\tn:增加新物品\ns:访问已有物品\tb:购买物品\na:进货\n");

	while ( c == 1 ){

		printf("想要做什么？\n");

		scanf("\n%c",&choice);

		switch( choice ){
  	    	case 'e':

				c=2;
				choice='\0';

				break;
  	      	
			case 'n':
				
				last ++;//下一次输入商品时就存放在另一个空间啦~ 
    	        printf("新物品 名称:(结束输入请输入#)\n");

				for(a=0;a<500;a++){
     	       		scanf("%c",&(num[last].name[a]));
     		       	if (num[last].name[a] == '#'){
            			num[last].name[a] = '\0';
						break;
					}
				}

				printf("新物品 介绍：(结束输入请输入@)\n(请控制在500字以内，不然程序会崩溃。)\n");

				for(a=0;a<500;a++){
        	    	scanf("%c",&(num[last].instruc[a]));
        	    	if (num[last].instruc[a] == '@'){
            			num[last].instruc[a] = '\0';
						break;
					}
				}

				printf("新物品 价格:");
				scanf("%d",&num[last].price);

				printf("\n知道了。记得进货哟~亲~\n");
				
				
				choice='\0';
				
				break; 
	        
			case 's':
	        	
				printf("好的，下面是目前已经有的商品：\n");

				for(a=0;a<last;a++){
	        		i=a+1;
	        		printf("%d号商品名称：",i);
	        		
					for(b=0;b<500;b++){
						if(num[i].name[b] == 0 &&num[i].name[b+1] == 0){
							break;
						}
	        			printf("%c",num[i].name[b]);
					}

					printf("\n介绍：");

					for(b=0;b<500;b++){
						if(num[i].instruc[b] == 0 &&num[i].instruc[b++] == 0){
							break;
						}
	        			printf("%c",num[i].instruc[b]);
					}
					
					printf("\n价格:%d",num[i].price);
					printf("\n剩余数量:%d件",num[i].quant);

					printf("\n\n");
				}
				choice='\0';
				break;

    	    case 'b':
    	    	
				printf("请输入要购买的物品编号：\n");
				scanf("%d",&j);
				
				printf("您要购买的物品是：\n");
				
				for(a=0;a<500;a++){
					
					if( num[j].name[a] == 0 &&num[j].name[a+1] == 0 ){
						break;
					}
					printf("%c",num[j].name[a]);
				
				}
				
				printf("\n这是一件很棒的商品哦~\n请看卖家介绍~\n");
				
				for(a=0;a<500;a++){
					
					if( num[j].instruc[a] == 0 &&num[j].instruc[a+1] == 0 ){
						break;
					}
					printf("%c",num[j].instruc[a]);
				}
				
				printf("\n哦~心动了吗？心动了就赶紧买吧！");
				printf("\n价格：%d,\n剩余：%d件。\n",num[j].price,num[j].quant);
				
				printf("您要买多少件呢？");
				
				scanf("%d",&m);
				
				if( m>num[j].quant ){
					printf("抱歉呢，库存不足~\n");
				}else{
					printf("好的！一共是%d元~商品已售出~",num[j].price*m);
					
					num[j].price -= m;
					
					printf("\n还剩%d件哦。\n",num[j].price);
				} 

     	   		choice='\0';
     	   		break;
    	    
			case 'a':
    	    	
    	    	printf("请输入商品编号~\n");
				scanf("%d",&n);
				
				printf("您要进货的商品是：\n");
				
				for(a=0;a<500;a++){
					
					if( num[n].name[a] == 0 &&num[n].name[a+1] == 0 ){
						break;
					}
					printf("%c",num[n].name[a]);
				
				}
				
				printf("\n进货多少件呢？\n");
				scanf("%d",&o);
				
				num[n].quant += o;
				
				printf("进货完成~\n");

    	    	choice='\0';
    	    	break;
    	    
			default:
    	    	system("cls");
				printf("\n不对呢~重新输入哦?\n");
    	    	choice='\0';
    	    	
				getchar();
				break;
		}

	}
	
	printf("谢谢使用。\n");
	printf ("thanks for using my program.\n\n\n\n                   ——ice1000 千里冰封\n\n\n");
}

