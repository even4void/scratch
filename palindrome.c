#include <stdio.h>
#include <stdbool.h>

bool is_palindrome(int x) {
    if (x < 0 || (x % 10 == 0 && x != 0)) return false;

    int reverse = 0;
    while (x > reverse) {
        reverse = reverse*10 + x % 10;
        x /= 10;
    }

    return x == reverse || x == reverse/10;
}

int main(void) {
    int x;
    printf("Enter n: ");
    scanf("%d", &x);
    printf("%s\n", is_palindrome(x) ? "true" : "false");
    return 0;
}
