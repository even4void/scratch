#include <stdio.h>
#include <math.h>

int main(int argc, char** argv) {
    double d = 1.4916681462400412e-154;
    double x = -1.0;
    if (argc > 5) {
        printf("argc > 5");
        x = x+(double)argc;
    }
    printf("test = %20.20g\n", pow(d, x));
    printf("test = %20.20g\n", pow(d, -1.0));
    return 0;
}
