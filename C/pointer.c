#include "stdio.h"
#include "stddef.h"
#include "stdlib.h"
#include "stdint.h"
#include "string.h"

double doubler(int x) { return x * 2; }
typedef double double_to_int_func(int);


int main(int argc, char const *argv[])
{
    int a = 5;
    int b = 10;
    int c[100];

    int* ptr_a = &a;
    int* ptr_b = &b;

    // 普通のデリファレンス
    printf("%d\n", *ptr_a);

    // アドレス16進数
    printf("%p\n", ptr_a);
    // アドレス10進数
    printf("%d\n", ptr_a);
    // 400?
    printf("%d\n", ptr_a+100);

    // 整数の比較 5 < 10
    printf("%d\n", *ptr_a < *ptr_b);
    // アドレスの比較
    printf("%d\n", ptr_a > ptr_b);

    // 配列のインデックスの差 
    // C99よりポインタ同士の減算が返す型はptrdiff_t型
    ptrdiff_t diff = &c[100] - &c[50];
    printf("%d\n", diff);

    // コンパイルエラー
    // &c[50] + &c[100];
    // &c[50] * &c[100];
    // &c[50] / &c[100];

    // 警告あり
    short* ptr_s = (long*)5;
    // 警告なし
    void* ptr_v = (long*)5;

    // ヌルポインタ
    int* ptr_d = NULL;
    printf("%p\n", ptr_d);
    // 定義だけでも、どこかを指している
    int* ptr_e;
    printf("%p\n", ptr_e);

    // ptrdiff_tをunsigned intと比較してはダメ
    // ptrdiff_tはsize_tと比較する
    int* f; int* g;
    unsigned int h = 5;
    f - g > h;

    // 関数ポインタ　使用するときは*付けなくてよい
    double (*func_ptr)(int) = &doubler;
    double i = func_ptr(5);
    printf("%f\n", i);

    // 定義した関数型を使って、関数ポインタの変数を定義
    double_to_int_func* ptr_dti = &doubler;
    printf("%f\n", ptr_dti(5));

    // ローカル変数のアドレスを直接返すのはダメ
    // スコープを抜けると、存在しないデータのアドレスを返すことになる
    int* return_ptr_to_local_var_1(void) {
        int x = 100;
        return &x;
    }
    // ポインタ変数に代入して返せばエラーは出ない
    // ということは、ローカル変数はポイントされた時点でローカル変数ではなくなる？
    int* return_ptr_to_local_var_2(void) {
        int y = 100;
        int* ptr_y = &y;
        return ptr_y;
    }
    int* ptr_r = return_ptr_to_local_var_2();
    printf("%p\n", ptr_r);
    printf("%d\n", *ptr_r);

    // mallocはvoid*を返すので、下のように明示的に型キャストしてやるのがよい
    int* ptr_aa = malloc(200);
    int* ptr_ab = (int*)malloc(200);

    // 文字列リテラルは変更不可 ランタイムエラー発生
    // str_a[5] = 'O';
    char* str_a = "helloworld";
    // 文字列配列
    char str_b[] = "helloworld";

    printf("%s\n", str_a+1);
    printf("%c\n", *(str_b+1));
    printf("%p\n", str_b+1);

    // 確保した領域に文字列をコピー
    char* str = (char*)malloc(6);
    strcpy(str, "abcde");
    printf("%s\n", str);

    // 単なるintやshortといったデータ型のサイズは、プラットフォームによってそのサイズが異なる
    // C99からプラットフォームに依存しない型としてint64_tなどが導入された
    // stdint.hをインクルードして使用する
    int64_t ix = -5;
    uint64_t uix = 10;




    return 0;

}