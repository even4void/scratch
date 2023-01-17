import os
import random

# Sattolo algorithm & Co.
# https://danluu.com/sattolo/
# This is an extra long comment line to test whether it is highlighted correctly as too


def shuffle(a: list[int]) -> None:
    n = len(a)
    for i in range(n - 1):
        j = random.randrange(i, n)
        a[i], a[j] = a[j], a[i]


def sattolo(a):
    n = length(a)
    for i in range(n - 1):
        j = random.randrange(i + 1, n)
        a[i], a[j] = a[j], a[i]


xs = [1, 2, 3, 4, 5, 6, 7]
xs[0] and True

shuffle(xs)
print(xs)
