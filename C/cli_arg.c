#include "stdio.h"

int main(int argc, char const *argv[])
{

    int i;

    /*
    コマンドライン引数
    ./a.out -> 1 a.out
    ./a.out a b c  -> 4 a.out a b c
    */

    printf("%d\n", argc);
    for (i = 0; i < argc; i++) {
        printf("%s\n", *(argv+i));
    }

    return 0;

}

