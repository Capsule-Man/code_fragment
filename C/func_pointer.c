#include "stdio.h"

// 関数型の宣言
typedef double f(int number);

// 関数ポインタの宣言
typedef double (*ff)(int number);

// 関数定義
double intToDouble(int number){
    return (double)number;
}

int main(int argc, char const *argv[])
{

    printf("%f\n", intToDouble(5));

    // 定義した関数へのポインタ
    f* f_ptr = &intToDouble;
    printf("%f\n", f_ptr(5));

    // 関数ポインタの宣言
    double (*ff)(int number);
    // 関数ポインタへの代入
    ff = &intToDouble;
    printf("%f", (*ff)(5));

    return 0;
}
