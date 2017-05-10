#include "RBTree.h"
#include <iostream>
#include <cstdlib>
#include <ctime>
using namespace std;

#define N 10

int main() {
	srand(time(NULL));
	int i;
	int arr[N];
	for (i = 0; i < N; ++i) {
		int t = rand() % 100;
		cout << t << ' ';
		arr[i] = t;
	}
	cout << endl;
	skfe::DynamicRBTree<int> tr;
	for (i = 0; i < N; ++i) tr.Insert(arr[i]);
	skfe::DynamicRBTree<int>::iterator it = tr.begin();
	while (it != tr.end()) {
		cout << *it << ' ';
		++it;
	}
	cout << endl;
	while (1) {
		int x;
		cin >> x;
		it = tr.Find(x);
		cout << "Find : " << (it != tr.end() ? "Yes" : "No") << endl;
		it = tr.LowerBoundItem(x);
		cout << "LowerBound : ";
		if (it != tr.end()) cout << *it << endl;
		else cout << "Failed" << endl;
		it = tr.UpperBoundItem(x);
		cout << "UpperBound : ";
		if (it != tr.end()) cout << *it << endl;
		else cout << "Failed" << endl;
	}
	return 0;
}
