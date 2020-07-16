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

