#include <stdio.h>

#define SWAP(x, y) do { typeof(x) SWAP = x; x = y; y = SWAP; } while (0)

int isort(int *lst, int len) {
    int i, j, count = 0;
    for(i=1; i<=len-1; i++) {
        for(j=i; j>0; j--) {
        	if (lst[j-1] > lst[j]) {
                SWAP(lst[j], lst[j-1]);
                count++;
        	}
        }
    }
    return(count);
}

int main() {
    int i, c = 0;
    int l[] = {44, 40, 65, 79, 42, 82, 46, 33, 57, 100,
               23, 98, 28, 35, 6, 63, 88, 18, 20, 81,
               83, 38, 67, 17, 56, 74, 60, 39, 61, 76,
               53, 66, 73, 25, 19, 50, 70, 93, 92, 14,
               37, 8, 4, 15, 27, 55, 13, 64, 71, 10,
               5, 2, 75, 77, 7, 9, 11, 49, 43, 91,
               85, 72, 32, 26, 97, 99, 34, 86, 96, 78,
               90, 59, 24, 31, 94, 80, 45, 12, 95, 1,
               16, 84, 62, 68, 87, 58, 29, 51, 52, 69,
               48, 3, 21, 22, 54, 47, 36, 41, 30, 89};
    c = isort(l, 100);
    printf("Number of op=%d\n", c);
    for (i=0; i<(sizeof(l)/sizeof(int)); i++)
        printf(" %d", l[i]);
    printf("\n");
}
