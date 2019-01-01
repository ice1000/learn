#include <iostream>

using namespace std;

int powi(int bottom, int top)
{
	return top == 0 ? 1 : bottom * powi(bottom, top - 1);
}

int number_len(int number)
{
	for (int i = 1; i <= 9; i++)	
		if (number / powi(10, i) == 0)
			return i;
	return 0;
}

int is_hui(int number)
{
	const int len = number_len(number);
	int* broken = new int[len];
	for (int i = len; i > 0; i--)
		broken[len - i] = (number % powi(10, i)) / powi(10, i - 1); 
	for (int i = 0; i < len / 2; i++)
		if (broken[i] != broken[len - i - 1])
		{
			delete broken;
			return 0;
		}
	delete broken;
	return 1;
}

int satisfied(int number)
{
	return (is_hui(number) && is_hui(powi(number, 2)) && is_hui(powi(number, 3)));
}

int main(int argc, char const *argv[])
{
	cout<<"\nIn (10, 1000):"<<endl;
	for (int i = 11; i < 1000; i++)
	{
		if (satisfied(i))
			cout<<i<<endl;
	}
	cout<<endl;
	return 0;
}
