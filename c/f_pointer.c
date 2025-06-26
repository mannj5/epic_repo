#include <stdio.h>
#include <stdlib.h>

#define SUCCESS 0
#define ERROR 1

int square(int x) {return x * x;}

int triple(int x) {return 3 * x;}

int increment(int x) {return x + 1;}

int eval(int (*f)(int), int x) {return f(x);}

int main(int argc, char** argv) {
    if (argc != 2) {
        return ERROR;
    }
    int x = atoi(*(argv + 1));
    printf("%d\n", eval(square, x));
    printf("%d\n", eval(triple, x));
    printf("%d\n", eval(increment, x));
    return SUCCESS;
}