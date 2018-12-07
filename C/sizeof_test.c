#include "stdio.h"

int main(int argc, char const *argv[])
{
    size_t a = sizeof(void);
    size_t b = sizeof(0);
    size_t c = sizeof('x');
    size_t d = sizeof("hello");

    printf("%zu\n", a);
    printf("%zu\n", b);
    printf("%zu\n", c);
    printf("%zu\n", d);

    return 0;
}
