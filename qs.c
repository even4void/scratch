#include <stdio.h>

#define SWAP(x, y) do { typeof(x) SWAP = x; x = y; y = SWAP; } while (0)

void qs(int *lst, int start, int end) {
    int i, j, p;
    if(start < end) {
        p = start;
        i = start;
        j = end;
        while (i < j) {
            while (lst[i] <= lst[p] && i < end)
                i++;
            while (lst[j] > lst[p])
                j--;
            if (i < j) {
                SWAP(lst[i], lst[j]);
            }
        }
        SWAP(lst[p], lst[j]);
        qs(lst, start, j-1);
        qs(lst, j+1, end);
    }
}
