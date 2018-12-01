#include <stdio.h>
#include <stdlib.h>

void swap(int* x, int* y) {
    int tmp = *x;
    *x = *y;
    *y = tmp;
}

void rec_char_pointer(char* str) {
    /* strはポインタ */
    printf("%c\n", *str); 
    printf("%p\n", str); 
    printf("%s\n", str); 
}

void rec_int_pointer(int* array) {
    printf("%d\n", *array); 
    printf("%p\n", array); 
}

typedef struct Worker {
    char* name[100];
    int age;
    float salary;
} CoWorker;

int main(void) {

    int x = 10;
    int *x_pointer = &x;
    printf("%d\n", x);
    printf("%d\n", *x_pointer);
    printf("%p\n", x_pointer);

    int *y = 0;
    int *y = 10;
    printf("%p", y);

    int hoge = 777;
    int geho = 444;
    swap(&hoge, &geho);
    printf("%d\n", hoge);
    printf("%d\n", geho);

    int x = 100;
    char y = 'A';
    int* z = &x;
    printf("%d\n", sizeof(x));
    printf("%d\n", sizeof(y));
    printf("%d\n", sizeof(z));

    int array[5] = {1,10,100,1000,10000};
    int* p = &array[0];
    for(int i = 0; i < 5; i++) {
        printf("%d\n", *p);
        p++;
    }

    int array[] = {1, 10, 100, 1000, 10000};
    int* p = &array[0];
    printf("%d\n", *p+2);
    printf("%d\n", *(p+2));

    char hoge[10] = "abcdef";
    char* p = &hoge[0];
    rec_char_pointer(p);

    int arr[5] = {1,2,3,4,5};
    int* p = &arr[2];
    rec_int_pointer(p);

    int x = 10;
    int y = 20;
    int* hoge = &x;
    int* piyo = &y;
    int* tmp;
    tmp = hoge;
    hoge = piyo;
    piyo = tmp;
    printf("%d\n", *hoge);
    printf("%d\n", *piyo);

    int arr[5] = {1,2,3,4,5};
    int* p = &arr[0];
    printf("%d", *(p+3));
    printf("%d", p[3]);

    char* p = "helloworld";
    char* p2 = *(p+4);
    printf("%s\n", p);
    printf("%c\n", *(p+4));
    p2 = 'a';
    printf("%c\n", p2);
    printf("%s\n", p);

    CoWorker wk;
    CoWorker* wkp = &wk;
    wkp->age = 29;
    wkp->salary = 160000.0;
    printf("%d\n", wkp->age);
    printf("%f\n", wkp->salary);

    int* buf;
    int num = 5;
    buf = (int *)malloc(num * sizeof(int));
    if (!buf) {
        printf("fail\n");
    }
    for(int i; i < num; i++) {
        *(buf+i) = i;
    }
    for(int i; i < num; i++) {
        printf("%d\n", *(buf+i));
    }
    free(buf);

    char* file = "20181130.c";
    FILE *fp;
    fp = fopen(file, "r");
    if (!fp) {
        printf("fail");
        exit(1);
    }
    char ch;
    for(;;){
        ch = fgetc(fp);
        if (ch == EOF) {
            break;
        }
        printf("%c", ch);
    }
    fclose(fp);

    char* file = "20181130.c";
    char buf[10];
    FILE *fp;
    fp = fopen(file, "r");
    if (!fp) {
        exit(1);
    }
    while(fgets(buf, 10, fp) != NULL) {
        printf("%s", buf);
    }
    fclose(fp);

    char* file = "write.txt";
    char buf[100] = "abcdefg";
    FILE* fp;
    int i;
    fp = fopen(file, "w");
    if (!fp) {
        printf("fail");
        exit(1);
    }
    for(i = 0; buf[i] != '\0'; i++) {
        printf("%c", buf[i]);
        fputc(buf[i], fp);
    }
    fclose(fp);

    char buf[100];
    fgets(buf, 10, stdin);
    printf("%s", buf);

    return 0;

}