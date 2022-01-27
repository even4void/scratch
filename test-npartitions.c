#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

void npartitions(int n, int *alpha, int *beta) {
  int nmax = 100;
  int base = 10000;
  int a[nmax];
  int b[nmax];
  int k, m, s;

  for (k = 0; k < n; ++k) {
    a[k] = 0;
    b[k] = 1;
  }

  for (m = 2; m < n; ++m) {
    for (k = m; k < n; ++k) {
      s = b[k] + b[k - m];
      b[k] = s % base;
      div_t q = div(s, base);
      a[k] = a[k] + a[k - m] + q.quot;
    }
  }

  *alpha = a[n];
  *beta = b[n];
}

int main(void) {
  int alpha = 0;
  int beta = 0;
  int x;
  printf("Enter n: ");
  scanf("%d", &x);
  npartitions(x, &alpha, &beta);
  printf("%d, %d\n", alpha, beta);
  return 0;
}
