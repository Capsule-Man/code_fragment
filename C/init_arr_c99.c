#include "stdio.h"

int main(int argc, char const *argv[])
{
    int arr[10] = { [2] = 2, [4] = 4 };

    /*
    配列のインデックスにはintではなくsize_t型を使う方がよい
    int型の最大数以上の長さの配列を作れるので、
    intをインデックスとして使うとアクセスできない要素が存在することになるらしい
    しかし、現実的にそんなケースあるか？

    sizeofの書式は%zuを使うべし
    */

    size_t i;
    size_t len = sizeof(arr) / sizeof(int);

    for (i = 0; i < len; i++) {
        printf("%d\n", arr[i]);

    }

    printf("%zu", len);

    return 0;
}
