#include <iostream>

int main(){

    int a = 1;
    int& b = a;
    int* c = &a;

    *c = 2;

    std::cout << a << std::endl;
    std::cout << b << std::endl;
    std::cout << c << std::endl;
}