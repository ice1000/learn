#include <stdio.h>
#include <math.h>
#include <windows.h>
#define r 10
#define R 172

int main(void){
	
FILE*fp;

int n;
int i,j,e;
int a;

if((fp=fopen("LOVE.txt","w"))==NULL) 
    {
   
    printf("File open error!\n");
    exit(0);
    
	}
    
for(i=1,a=r;i<r/2;i++,a--) 
    {
    
	for(j=(int) ( r-sqrt((r*r-(a-i)*(a-i))) );j>0;j--) 
        {
     
	    printf(" ");
        fprintf(fp,"%s"," "); 
     
	    }
    
    for(e=1;e<=2*sqrt((r*r-(a-i)*(a-i)));e++) 
        {
       
	    printf("\3"); 
        fprintf(fp,"%s"," * "); 
      
	    }
            
	for(j=(int) ( 2*( r-sqrt( (r*r-(a-i) * (a-i) ) ) ) );j>0;j--) 
        {
     
	   printf(" "); 
        fprintf(fp,"%s"," ");
      
	    }
           
	for(e=1;e<=2*sqrt( (r*r-(a-i) * (a-i) ) );e++) 
        { 
        
		printf("\3"); 
        fprintf(fp,"%s"," * ");
     
	    }

    printf("\n");
    fprintf(fp,"%s","\n"); 
        
		}
for(i=1;i<40;i++) 
    { 
	
	if(i==6)
		{
	
		printf(" I LOVE 御坂美琴みさか        ");
		i+=30;
	
		}
		
	printf("\3"); 
	fprintf(fp,"%s"," * "); 

	}

printf("\n"); 

for(i=1;i<=R/2;i++) 
	{
	
	if(i%2||i%3) continue;
	
	for(j=(int) ( R-sqrt( (double) (R*R-i*i) ) );j>0;j--)
		{

		printf(" "); 
		fprintf(fp,"%s"," "); 
	
		}
	
	for(e=1;e<=2*( sqrt( (double)(R*R-i*i) ) - (R-2*r) );e++)
		{
	
		printf("\3"); 
		fprintf(fp,"%s"," * " ); 
	   
	    }
	printf("\n");
	}

printf("请选着播放形式：\n 自动播放：按 1 ，控制播放：按 0\n"); 

printf("按完数字后请按 enter 键\n"); 

scanf("%d",&n); 

if(n==0)
    { 
    
	while(1)
        {
		system("color a");
        system("pause"); 
       
	    system("color b"); 
        system("pause"); 
       
	    system("color c");
        system("pause"); 
       
	    system("color d"); 
        system("pause"); 
       
	    system("color e");
        system("pause"); 
      
	    system("color f");
        system("pause");
        }
    }
else
    {
    while(1)
        {
		system("color a"); 
        Sleep(100); 
        
		system("color b");
        Sleep(100); 
        
		system("color c"); 
        Sleep(100); 
       
	    system("color d");
        Sleep(100); 
       
	    system("color e"); 
        Sleep(100);
      
	    system("color f"); 
        Sleep(100); 
      
	    system("color 0"); 
        Sleep(100); 
        }
    }
return 0;
}
