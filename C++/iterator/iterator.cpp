#include <iostream>
#include <iterator>
#include <vector>
#include <algorithm>

using namespace std;

void test1() {
    vector<int> v = {1, 2, 3, 4, 5};
    vector<int>::iterator it = prev(v.end());
    cout << *it << endl;
}

void test2() {
    vector<int> v = {2, 3, 4, 5, 6};
    for(int x : v) {
        cout << x << endl;
    }
}

void test3() {
    vector<int> v = {1, 2, 3};
    for_each(v.cbegin(), v.cend(), [](int x) {
        cout << x  << endl;
    });
    for_each(v.rbegin(), v.rend(), [](int x){
        cout << x << endl;
    });
    for_each(v.crbegin(), v.crend(), [](int x){
        cout << x << endl;
    });
}

void test4() {
    vector<int> src = {1, 2, 3, 4, 5};
    vector<int> desb;

    desb.reserve(src.size());
    copy(src.begin(), src.end(), back_inserter(desb));

    for(int x : desb) {
        cout << x << endl;
    }
}

int main()
{
    test3();
}