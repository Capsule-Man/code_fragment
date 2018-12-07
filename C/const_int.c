#include "stdio.h"

int main(int argc, char const *argv[])
{

    // コンパイルエラー
    int const x = 100;
    x = 200;
    
    // コンパイルエラー
    const int x = 100;
    x = 200;

    // コンパイルエラー
    int x = 100;
    int const* x_ptr = &x;
    *x_ptr = 200;

    // コンパイル通る
    int x = 100;
    int y = 200;
    int const* x_ptr = &x;
    x_ptr = &y;

    // コンパイルエラー
    int x = 100;
    int y = 200;
    int* const x_ptr = &x;
    x_ptr = &y;

    // コンパイル通る
    int x = 100;
    int* const x_ptr = &x;
    *x_ptr = 200;

    // const intとして定義したのに、以下のように書き換えることができる
    // constは絶対安全ではない
    const int x = 10;
    printf("%d", x);
    (*(int*)&x) = 100;
    printf("%d", x);

    return 0;
}
