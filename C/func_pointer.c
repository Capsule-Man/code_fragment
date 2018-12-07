#include "stdio.h"

// 関数型の宣言
typedef double f(int number);

// 関数定義
double intToDouble(int number){
    return (double)number;
}

int main(int argc, char const *argv[])
{
    // 定義した関数へのポインタ
    f* f_ptr = &intToDouble;
    printf("%f\n", f_ptr(5));
    printf("%f", intToDouble(5));

    return 0;
}
