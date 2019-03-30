#include <algorithm>
#include <iostream>
#include <vector>


void test1() {
    std::vector<int> v = {1,2,3,4,5};
    std::cout << std::boolalpha;

    bool result_1 = all_of(v.begin(), v.end(), [](int x){ return x > 5; });
    bool result_2 = any_of(v.begin(), v.end(), [](int x){ return x < 2; });
    bool result_3 = none_of(v.begin(), v.end(), [](int x){ return x > 5; });

    std::cout << result_1 << std::endl; // false
    std::cout << result_2 << std::endl; // true
    std::cout << result_3 << std::endl; // true
}

void test2() {
    std::vector<int> v = {1,2,3,4,5};
    std::for_each(v.begin(), v.end(), [](int x){ std::cout << x << std::endl; });
    std::for_each(v.begin(), v.end(), [](int& x) mutable { x *= 2; });
    std::for_each(v.begin(), v.end(), [](int x){ std::cout << x << std::endl; });
}

void test3() {
    std::vector<int> v = {1, 3, 4, 2, 5, 2, 3, 5, 1};

    auto result_1 = std::find(v.begin(), v.end(), 1);
    auto result_2 = std::find_if(v.begin(), v.end(), [](int x){ return x >= 6; });
    int result_3 = std::count(v.begin(), v.end(), 2);
    auto it = std::next(result_1);

    std::cout << *result_1 << std::endl; // 1
    std::cout << *result_2 << std::endl; // 0
    std::cout << result_3 << std::endl; // 2
    std::cout << *it << std::endl; // 3
}


int main() {
    test3();
}