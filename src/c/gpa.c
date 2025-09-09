#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** argv)
{
	double total = 0.0;
	double n = (double) argc - 1.;
	for (int i = 1; i < argc; i++) {
		total += atoi(*(argv + i));
	}
	printf("Your current overall GPA is %.2f\n", total / n);
	return EXIT_SUCCESS;
}
