#include "stdio.h"

int main(int argc, char const *argv[])
{
    char buffer[32];
    char* endptr;
    long num;

    printf("input: ");
    if (scanf("%31[^\n]%*[^\n]", buffer) != 1) {
        fprintf(stderr, "error!\n");
        return 1;
    }
    scanf("%*c");

    num = strtol(buffer, &endptr, 10);

    return 0;
}
