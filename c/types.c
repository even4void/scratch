#include <stdio.h>

int main(void) {
  char x = 'd';
  int y = x * 2;
  printf("%d\n", y);

  int z = 100;
  char a[] = {z, z, 0};
  printf("%s\n", a);
  return 0;
}
