#include "stdio.h"

int is_prime(unsigned long n) {
    size_t i;
    for (i = 2; i < n; i++) {
        if (n % i == 0) return 0; 
        else {
            if (i == n - 1) return 1;
            else continue;
        }
    }
}

int main(int argc, char const *argv[])
{
    unsigned long number;
    scanf("%lu", &number);

    if (is_prime(number) == 1) {
        printf("yes");
    } else {
        printf("no");
    }

    return 0;
}
