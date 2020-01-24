#include <stdio.h>
#include <math.h>

int main() {
    unsigned long long num, last, digits, sum, i, end;

    printf("Enter n: ");
    scanf("%llu", &end);

    printf("Armstrong numbers between 1 to %llu are: \n", end);

    for(i=1; i<=end; i++) {
        sum = 0;
        num = i;
        digits = (int) log10(num) + 1;

        while(num > 0) {
            last = num % 10;
            sum = sum + ceil(pow(last, digits));
            num = num / 10;
        }

        if(i == sum) {
            printf("%llu, ", i);
        }
    }
    return 0;
}
