#include <stdio.h>

int factorial_acc(int n, int acc) {
  return n < 2 ? acc : factorial_acc(n - 1, n * acc);
}

int factorial(int n) { return factorial_acc(n, 1); }

int main() {
  int out = factorial(10);
  printf("%d\n", out);
}
