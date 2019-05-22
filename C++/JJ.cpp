#include <iostream>

int main() {
    char* a = new char[2];
    char b[] = {'r', 'r'};
    std::cout << sizeof a << std::endl;
    std::cout << sizeof b << std::endl;
    delete[] a;
}
