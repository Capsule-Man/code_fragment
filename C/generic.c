#include "stdio.h"

// 多重定義を可能にする_Genericマクロ
#define print_fmt(x) (_Generic( (x),\
    int: "%d\n",\
    double: "%f\n",\
    const char*: "%s\n",\
    default: "%x\n" ))

int main(int argc, char const *argv[])
{
    int n = 5;
    double d = 4.32;
    const char* s = "cyber monday";

    printf(print_fmt(n), n);
    printf(print_fmt(d), d);
    printf(print_fmt(s), s);

    return 0;
}
