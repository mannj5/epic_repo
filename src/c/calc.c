#include <stdio.h>
#include <stdlib.h>

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
                return EXIT_FAILURE;
            }
            printf("%d\n", x / y);
            break;
        default:
            return EXIT_FAILURE;
    }
    return EXIT_SUCCESS;
}