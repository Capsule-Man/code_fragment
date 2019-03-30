#include <iostream>
#include <cstdio>
#include <string>
#include <algorithm>

using namespace std;

void test1() {


    string s = "banana";
    s += " apple";

    string t = s.substr(0, 3);
    char& r = s[4];

    string i = s;
    string n = s.replace(0, 1, "n");

    char g[4] = {};
    s.copy(g, 3);

    string::size_type pos = s.find("p");

    cout << s << endl;
    cout << t << endl;
    cout << r << endl;
    cout << i << endl;
    cout << n << endl;
    cout << g << endl;
    cout << pos << endl;
}

void test2(){
    string s = "apple";
    string::iterator first = s.begin();
    string::iterator last = s.end();
    std::for_each(first, last, [](char x){
        cout << x << endl;
    });
}

void test3(){
    string s = "apple";
    string_view sv = s;
    cout << sv.substr(0, 2) << endl;
}

int main()
{
    test1();
}