#include <stdio.h>
#include <stdlib.h>

#define ERROR -1
#define SUCCESS 0

int main(int argc, char** argv) {
    char c = **(argv + 1);
    int x = atoi(*(argv + 2));
    int y = atoi(*(argv + 3));
    switch (c) {
        case '+':
            printf("%d\n", x + y);
            break;
        case '-':
            printf("%d\n", x - y);
            break;
        case '*':
            printf("%d\n", x * y);
            break;
        case '/':
            if (y == 0) {
                return ERROR;
            }
            printf("%d\n", x / y);
            break;
        default:
            return ERROR;
    }
    return SUCCESS;
}