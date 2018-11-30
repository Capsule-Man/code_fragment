#include <stdio.h>
#include <math.h>
#include <string.h>

#define ABC 100
#undef ABC
#define ABC 200

#define DOUBLE(x) (x)*(2)

int test(int x) {
    x = x * 2;
    return x;
}

int static_test(void) {
    static int x = 10;
    x++;
    printf("%d", x);
    return x;
}

int main(void) {

    float x, y;
    float z;
    x = 1;
    y = 2;
    z = x / y;

    int x = pow(2, 2);
    printf("%d", x);

    int x = 3, y = 5;
    printf("%d", 3 / 5);

    int hoge[5];
    hoge[0] = 1;
    hoge[1] = 2;

    int hoge[5] = {1, 2, 0, 0, 0};
    int hoge[5] = {1, 2};
    printf("%d", hoge[3]);

    char str;
    str = 'B';

    char str[5] = {'A', 'B', 'C', 'D', 'E'};
    char str[6] = "ABCDE";

    char str = 97;

    int hoge = 10;
    if(hoge = 10) {
        printf("%s", "hoge is 10");
    } else {
        printf("%s", "hoge is not 10");
    }

    int hoge = 1;
    switch (hoge) {
        case 2: break;
        case 4: break;
        case 6: break;
        case 8: 
            printf("%s", "hogee");
            break;
        default: printf("%s", "def");
    }

    int count = 0;
    do {
        printf("%d\n", count);
        count++;
    } while (count < 5);

    for (int i = 0; i < 5; i++) {
        printf("%d\n", i);
    }

    int y = 2, z;
    z = test(y);
    printf("%d", z);

    char str[20];
    char source[20] = "hello";
    strcpy(str, source);

    char left[20] = "hellow";
    char right[20] = "hello";
    int x = strcmp(left, right);

    static_test();
    static_test();
    static_test();

    printf("%s", "hello");
    printf("%d", x);

    int x = DOUBLE(100);
    printf("%d", x);

    return 0;
}
