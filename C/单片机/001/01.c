#include<reg52.h>

sbit led = P1^1;

void main(){
    unsigned i;
    while(1){
	    led = 0x00;
		for(i = 0; i < 10000; i++);
		led = 0x01;
		for(i = 0; i < 10000; i++);
	}
}