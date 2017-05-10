#include<stdio.h>
#include<stdlib.h>
//	#include<unistd.h>
//	#include<string.h>
//	#define FORMAT(x) ""#x".cmd"

char* format1(char a[],char i);
char* format2(char b[],char i);

int main(void) {
  char i = (char)1;
  printf ("thanks for using my program.\n\n\n\n                   ¡ª¡ªice1000 Ç§Àï±ù·â\n\n\n");
  char a[5];
  //	char b[10] = "start %c.cmd";
  char b[10];
  b[0] = 's';
  b[1] = 't';
  b[2] = 'a';
  b[3] = 'r';
  b[4] = 't';
  b[5] = ' ';
  a[1] = b[6] = '.';
  a[2] = b[7] = 'c';
  a[3] = b[8] = 'm';
  a[4] = b[9] = 'd';
  while(true){
    FILE *fp = fopen(format1(a,i),"w+");
    fprintf(fp,"start %c.cmd",i);
    system(format2(b,i));
    i ++;
    //		sleep(1);
  }
  return 0;
  //	char i = 'a';
  //	i++;
  //	printf("%c",i);
}

char* format1(char a[],char i){
  a[0] = i;
  return a;
}

char* format2(char b[],char i){
  b[6] = i;
  return b;
}
