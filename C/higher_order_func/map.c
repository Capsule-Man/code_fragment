#include "stdio.h"
#include "map.h"

int* map(size_t len, int* array, int(*func)(int x)){

    int new_array[len];
    int* ptr_new_array = &new_array[0];

    for(int i = 0; i < len; i++){
        int x = func(array[i]);
        new_array[i] = x;
    }

    for(int i=0;i<len;i++){
        printf("%d\n", new_array[i]);
    }

    return ptr_new_array;

}