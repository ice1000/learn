#include <iostream>
#include <conio.h>
#include <stdlib.h>
#include <time.h>
#include <Windows.h>
#include <stdbool.h>
using namespace std;
class snake
{public:
COORD food_coord;
snake *head;
snake *tail;
void gotoxy(int x, int y, int color);
void map();
void cre_food();
void HideCursor();
void cre_snake(int x, int y);
void start();
int get_key();
void wipe(int x, int y);
void move();
int is_eat();
int is_dead();
int score = 0, sleep = 500, level = 1, direct = 77;
private:
int x;
int y;
class snake *pre;
class snake *next;
}; 
const int UP = 72, DOWN = 80, LEFT = 75, RIGHT = 77, ENTER = 13, ESC = 27, SPACE = 32;
int main()
{
snake snake;
snake.HideCursor();
snake.map();
snake.start();
snake.cre_snake(15,12); 
snake.cre_food(); 
do
{
snake.move();
Sleep(snake.sleep);
} while (!snake.is_dead());
snake.gotoxy(13, 11, 0xD);
cout<<"Game over!";
getchar();
return 0;
}
void snake::HideCursor()
{
HANDLE hout = GetStdHandle(STD_OUTPUT_HANDLE);
CONSOLE_CURSOR_INFO cursor_info = { 1, 0 };
SetConsoleCursorInfo(hout, &cursor_info);
}
void snake::start()
{
int ch;
gotoxy(10, 11, 0xC);
cout<<"Enter键开始，Esc退出！";
ch = _getch();
if (ch == 27)
exit(0);
else
{
gotoxy(10, 11, 0xC);
cout<<" ";
}
}
int snake::get_key()
{
char ch;
ch = _getch();
if (ch == ENTER || ch == ESC || ch == SPACE) 
return ch;
else if (ch == -32) 
return _getch();
else 
return 0;
}
void snake::gotoxy(int x, int y, int color)
{
HANDLE hout = GetStdHandle(STD_OUTPUT_HANDLE);
COORD coord = { 2*x, y };
SetConsoleCursorPosition(hout, coord); 
SetConsoleTextAttribute(hout, color); 
}
void snake::map()
{
int i; 
int j; 
for (j = 0; j < 40; j++)
{
gotoxy(j, 0, 0xF);
cout<<"※";
gotoxy(j, 23, 0xF);
cout << "※";
}
for (i = 1; i < 23; i++)
{
gotoxy(0, i, 0xF);
cout<<"※";
gotoxy(31, i, 0xF);
cout<<"※";
gotoxy(39, i, 0xF);
cout<<"※";
}
gotoxy(34, 2, 0xB);
cout<<"贪吃蛇";
gotoxy(35, 3, 0xB);
cout<<"by me";
gotoxy(34, 5, 0xB);
cout<<"操作方法";
gotoxy(33, 7, 0xB);
cout<<"← ↑ ↓ →";
gotoxy(33, 8, 0xB);
cout<<"上下左右";
gotoxy(34, 10, 0xB);
cout<<"等 级";
gotoxy(34, 13, 0xB);
cout<<"得 分";
gotoxy(33, 16, 0xB);
cout<<"吃掉的食物";
gotoxy(33, 19, 0xB);
cout<<"空格键 暂停";
gotoxy(33, 21, 0xB);
cout<<"任意键 继续";
}
void snake::wipe(int x, int y)
{
gotoxy(x, y, 0xE);
cout<<" ";
}
void snake::cre_food()
{
int x, y;
snake *p = head;
srand((unsigned int)time(NULL));
do
{
x = 2 + rand() % 29;
y = rand() % 23;
} while (x < 2 || y < 2);
while (p != NULL)
{
if (x == head->x&&y == head->y)
{
do
{
x = 2 + rand() % 29;
y = rand() % 23;
} while (x < 2 || y < 2);
p = head;
}
p = p->next;
}
food_coord.X = x;
food_coord.Y = y;
gotoxy(x, y, 0xD);
cout<<"●";
}
void snake::cre_snake(int x, int y)
{
snake *pNew =new snake();
if (head == NULL)
{
head = pNew;
head->x = 15;
head->y = 12;
head->next = NULL;
head->pre = NULL;
tail = head;
}
else
{
pNew->x = x;
pNew->y = y;
head->pre= pNew;
pNew->next = head;
pNew->pre = NULL;
head = pNew;
}
gotoxy(x, y, 0xA);
cout<<"■";
}
int snake::is_eat()
{
if (head->x == food_coord.X&&head->y == food_coord.Y)
return TRUE;
else
return FALSE;
}
int snake::is_dead()
{
snake *p = head->next;
while (p != NULL)
{
if (head->x == p->x&&head->y == p->y)
return TRUE;
p = p->next;
}
if (head->x == 0 || head->y == 0 || head->x == 31 || head->y == 23)
return TRUE;
else 
return FALSE;
}
void snake::move()
{
if (_kbhit())
{
int key =0;
key =get_key();
if (key==UP || key == DOWN||key == LEFT || key == RIGHT)
direct = key;
else if (key ==32)
getchar();
}
switch (direct)
{
case UP:cre_snake(head->x, head->y - 1); break;
case DOWN:cre_snake(head->x, head->y + 1); break;
case LEFT:cre_snake(head->x - 1, head->y); break;
case RIGHT:cre_snake(head->x + 1, head->y); break;
}
if (!is_eat())
{
snake *p = tail;
int x = tail->x;
int y = tail->y;
wipe(x, y);
tail = tail->pre;
tail->next = NULL;
delete p;
}
else
{
cre_food();
switch (score / 100)
{
case 0:score += 10;
sleep = 600;
level = 1;
break;
case 1:
case 2:score += 15;
sleep = 400;
level = 2;
break;
case 3:
case 4:
case 5:score += 20;
sleep = 300;
level = 3;
break;
default:score += 30;
sleep = 100;
level = 4;
}
}
gotoxy(35, 11, 0xB);
cout<<level<<endl;
gotoxy(35, 11, 0xB);
cout << 1;
gotoxy(34, 15, 0xB);
cout<<score;
gotoxy(34, 15, 0xB);
cout << 0;
}
