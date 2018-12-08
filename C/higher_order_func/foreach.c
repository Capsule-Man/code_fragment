#include "stdio.h"
#include "foreach.h"


int* foreach(size_t len, int* array, int(*func)(int x)){

    for(size_t i = 0; i < len; i++){
        array[i] = func(array[i]);
    }
    return array;

}