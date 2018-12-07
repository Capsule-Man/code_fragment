#include "stdio.h"

const int x[] = {1, 2, 3};
const int y[] = {4, 5, 6};

int produce_scalar(const int* arr1, const int* arr2, size_t len) {

    size_t i;
    int sum = 0;

    for(i = 0; i < len; i++) {
        sum = sum + arr1[i] * arr2[i];
    }

    return sum;

}

int main(int argc, char const *argv[])
{
    printf("%d", produce_scalar(x, y, sizeof(x) / sizeof(int)));
    return 0;
}
