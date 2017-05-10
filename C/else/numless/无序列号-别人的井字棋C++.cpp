#include <iostream>

using namespace std;
void printboard(char chessboard[3][3]);
bool ifxwin(char chessboard[3][3]);
bool ifowin(char chessboard[3][3]);

int process1(int i);
int process2(int i);
int main()

{
	while (1)
	{
	    char chessboard[3][3]={
		{'1','2','3'},
		{'4','5','6'},
		{'7','8','9'}};
        
		int xinput=0;
        int oinput=0;
        int i1=0;
        int i2=0;
        
		bool xwin=false;
        bool owin=false;
        
		int ifrestart=0;
		cout<<"欢迎来到井字棋"<<endl;
		printboard(chessboard);
BACK:	cout<<"请X下棋:"<<endl;
		cin>>xinput;
		i1=process1(xinput);
		i2=process2(xinput);
		while (xinput>9||chessboard[i1][i2]=='O'||chessboard[i1][i2]=='X')
		{
            cout<<"输入错误，请重新输入"<<endl;
			cin>>xinput;
			i1=process1(xinput);
	    	i2=process2(xinput);
		}
		chessboard[i1][i2]='X';
		printboard(chessboard);
		xwin=ifxwin(chessboard);
		if (xwin==true)
		{
			cout<<"X赢了！恭喜！是否重新开始游戏？1是2否"<<endl;
			cin>>ifrestart;
			if (ifrestart==1)
			{
				continue;
			}
			else
			{
				break;
			}
		}
		cout<<"请O下棋:"<<endl;
		cin>>oinput;
		i1=process1(oinput);
		i2=process2(oinput);
		while (oinput>9||chessboard[i1][i2]=='X'||chessboard[i1][i2]=='O')
		{
            cout<<"输入错误，请重新输入"<<endl;
			cin>>oinput;
			i1=process1(oinput);
    		i2=process2(oinput);
		}
		chessboard[i1][i2]='O';
		printboard(chessboard);
		owin=ifowin(chessboard);
		if (owin==true)
		{
			cout<<"O赢了！恭喜！是否重新开始游戏？1是2否"<<endl;
			cin>>ifrestart;
			if (ifrestart==1)
			{
				continue;
			}
			else
			{
				break;
			}
		}
		goto BACK;
	}
	return 0;
}
void printboard(char chessboard[3][3])
{
    for (int i=0;i<9;i++)
    {
    	if (i<3)
    	{
    	    cout<<chessboard[0][i]<<' ';
    	    if (i==2)
    	        cout<<endl;
    	}else if (i>2&&i<6)
    	{
    		cout<<chessboard[1][i-3]<<' ';
    		if (i==5)
    		    cout<<endl;
    	}else
    	{
    		cout<<chessboard[2][i-6]<<' ';
    		if (i==8)
    		    cout<<endl;
    	}
    }
}
bool ifxwin(char chessboard[3][3])
{
	if (chessboard[0][0]=='X'&&chessboard[0][1]=='X'&&chessboard[0][2]=='X')
    {
        return true;
    }else if (chessboard[0][0]=='X'&&chessboard[1][1]=='X'&&chessboard[2][2]=='X')
    {
        return true;
    }else if (chessboard[0][0]=='X'&&chessboard[1][0]=='X'&&chessboard[2][0]=='X')
    {
        return true;
    }else if (chessboard[0][1]=='X'&&chessboard[1][1]=='X'&&chessboard[2][1]=='X')
    {
        return true;
    }else if (chessboard[0][2]=='X'&&chessboard[1][2]=='X'&&chessboard[2][2]=='X')
    {
        return true;
    }else if (chessboard[0][2]=='X'&&chessboard[1][1]=='X'&&chessboard[2][0]=='X')
    {
        return true;
    }else if (chessboard[1][0]=='X'&&chessboard[1][1]=='X'&&chessboard[1][2]=='X')
    {
        return true;
    }else if (chessboard[2][0]=='X'&&chessboard[2][1]=='X'&&chessboard[2][2]=='X')
    {
        return true;
    }else
    {
        return false;
    }
}
bool ifowin(char chessboard[3][3])
{
    if (chessboard[0][0]=='O'&&chessboard[0][1]=='O'&&chessboard[0][2]=='O')
    {
        return true;
    }else if (chessboard[0][0]=='O'&&chessboard[1][1]=='O'&&chessboard[2][2]=='O')
    {
        return true;
    }else if (chessboard[0][0]=='O'&&chessboard[1][0]=='O'&&chessboard[2][0]=='O')
    {
        return true;
    }else if (chessboard[0][1]=='O'&&chessboard[1][1]=='O'&&chessboard[2][1]=='O')
    {
        return true;
    }else if (chessboard[0][2]=='O'&&chessboard[1][2]=='O'&&chessboard[2][2]=='O')
    {
        return true;
    }else if (chessboard[0][2]=='O'&&chessboard[1][1]=='O'&&chessboard[2][0]=='O')
    {
        return true;
    }else if (chessboard[1][0]=='O'&&chessboard[1][1]=='O'&&chessboard[1][2]=='O')
    {
        return true;
    }else if (chessboard[2][0]=='O'&&chessboard[2][1]=='O'&&chessboard[2][2]=='O')
    {
        return true;
    }else
    {
        return false;
    }
}
int process1(int i)
{
	switch (i)
	{
    case 1:
        return 0;
    case 2:
        return 0;
    case 3:
        return 0;
    case 4:
        return 1;
    case 5:
        return 1;
    case 6:
        return 1;
    case 7:
        return 2;
    case 8:
        return 2;
    case 9:
        return 2;
	}
}
int process2(int i)
{
	switch (i)
	{
    case 1:
        return 0;
    case 2:
        return 1;
    case 3:
        return 2;
    case 4:
        return 0;
    case 5:
        return 1;
    case 6:
        return 2;
    case 7:
        return 0;
    case 8:
        return 1;
    case 9:
        return 2;
	}
}
