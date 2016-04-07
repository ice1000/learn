//HealthSystem.h By SD
//Corrected by ice1000
#include <conio.h>
#include <unistd.h>
#include <string.h>
#include <iostream>

void p(int x);
void m(int x);
void Info(void);

int health =20;
int hunger = 0;

/*
int i;
for(i = 0; i < 50; i++ ){
	info[i] = '\0';
}
*/

using namespace std;

int main(void){
	
	int i;

    char info[50];
    for(i = 0; i < 50; i++ ){
		info[i] = '\0';
	}
//初始化字符串数组info 
    if((health == 20)&&(hunger == 0)){
    	for(i = 0;i < 20; i++){
    		hunger --;
			sleep(30);
        	hunger --;
			sleep(30);
			health --;
    	}
//实在没搞懂你的意思，就让hunger--了40次、health--了20次。 
        if(health == 0){
        	strcat(info,"Dead");
        	puts(info);
        }
    }
//这个if完全没有任何意义，不过我还是给你保留了。 
    for(hunger = 0;hunger < 20;hunger++){
     	sleep(120);
    }
//这个for也没用任何意义，不过我改了条件之后至少可以执行了。 
}
//你每次sleep的时间真的很长，确定要这么做吗？ 
void lastm(int x){
	int i;
    for(i = health; i < 200; i++ ){
        health --;
        sleep(x);
    }
}
//这里上下俩函数都是我给你几乎是全删了重新打的。 
void lastp(int x){
	int i;
    for(i = health; i > -1; i-- ){
    	health ++;
        sleep(x);
    }
}
//从未见过如此写循环的！！！ 
void p(int x){
    health += x;
}
//这俩函数也没有任何意义。 
void m(int x){
    health -= x;
}
//下面这个函数是槽点最多的，也是我给你全删了重新打的。 
//完全可以用switch啊你这个SB！！！！ 
//写那么多if给谁看啊！！！！ 

//switch(hunger){
//	case 0:
//		strcpy(info,"Extremly Hungry");
//		break;
//	case 20:
//		strcpy(info,"Full");
//		break;
//	case 1:case 2:case 3:case 4:case 5:
//		strcpy(info,"Almost Full");
//		break;
//	case 6:case 7:case 8:case 9:case 10:
//		strcpy(info,"Fine");
//		break;
//	case 11:case 12:case 13:case 14:case 15:
//		strcpy(info,"Well");
//		break;
//	default:
//		strcpy(info,"Hungry");
//		break;
//}
Info(char* info){
	int i;
	for(i = 0; i < 50; i++ ){
		info[i] = '\0';
	}
    if(hunger == 20){
    	strcpy(info,"Extremly Hungry");
   	}
   	if(hunger == 0){
   		strcpy(info,"Full");
   	}
   	if((hunger < 20)&&(hunger > 15)){
   		strcpy(info,"Hungry");
   	}
   	if((hunger <= 15)&&(hunger > 10)){
       	strcpy(info,"Well");
    }
   	if((hunger <= 10)&&(hunger > 5)){
       	strcpy(info,"Fine");
   	}
   	if((hunger <= 5)&&(hunger > 0)){
       	strcpy(info,"Almost Full");
   	}
}
