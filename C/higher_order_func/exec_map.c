#include "stdio.h"
#include "foreach.h"
#include "map.h"
#include "custom.h"


ptr_func* ptr_plus_one = &plus_one;
ptr_func* ptr_doubler = &doubler;

int main(int argc, char const *argv[])
{
    int test[5] = {1,2,3,4,5};
    size_t len = sizeof(test) / sizeof(int);

    int* arr = map(len, &test[0], ptr_plus_one);

    for(size_t i = 0; i < len; i++) {
        printf("%d\n", arr[i]);
    }

    return 0;
}
