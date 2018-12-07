#include "stdio.h"

struct Worker {
    char const* name;
    int age;
    double salary;
};

// C11から追加された構造体の中でのみ許される無名の構造体
struct Worker_c11 {
    struct {
        char const* first_name;
        char const* second_name;
    };
    int age;
    double salary;
};

int main(int argc, char const *argv[])
{
    //　配列のように構造体を初期化する　一般的なやり方
    struct Worker taro = {"taro oshima", 30, 1032142.5};
    printf("%s\n", taro.name);
    printf("%d\n", taro.age);
    printf("%f\n", taro.salary);
 
    //　フィールドを指定して構造体を初期化する C99で追加された
    struct Worker hanako = {.name = "hanako yamada", .age = 34};
    printf("%s\n", hanako.name);
    printf("%d\n", hanako.age);
    printf("%f\n", hanako.salary);

    //　無名構造体を含む構造体の初期化
    struct Worker_c11 yoshio = {{"yoshio", "kojima"}, 30, 1032142.5};
    printf("%s %s\n", yoshio.first_name, yoshio.second_name);
    printf("%d\n", yoshio.age);
    printf("%f\n", yoshio.salary);

    return 0;
}
