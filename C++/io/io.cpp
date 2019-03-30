#include <iostream>
#include <string>
#include <filesystem>

using namespace std; 

void test1() {
    cout << "入力、プリーズ: ";
    string s;
    cin >> s;
    cout << "入力 = " << s << endl;
}

void test2() {
    clog << "Error" << endl;
}

int main(int argc, char** argv)
{

    char const* second_arg = argv[1];
    if (second_arg == nullptr)
    {
        clog << "殿、えらいことです、引数がありませぬぞう" << endl;
    }
    else 
    {
        cout << "殿、引数が無事に見つかりましたあ: " << second_arg << endl;
    }

    test3();
}