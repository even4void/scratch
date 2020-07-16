#!/usr/bin/env python3

# This is a little notebook to accompagny the following textbook, where code
# is all C++ 11.
#
# Laaksonen, A. (2017). Competitive programmer’s handbook.
# https://cses.fi/book.html
#
# Note that running this script requires Python 3.x.
# Time-stamp: <2019-01-29 21:13:03 chl>

import math
import sys
from itertools import count, islice

# Python 3.x only considers long integers, which together with dynamic typing
# helps to avoid integer overflow or cast errors.
print(sys.maxsize)

# Modular arithmetic is easy too, e.g. n! modulo m.
x = 1
n, m = 15, 2
r = [(x * i) % m for i in range(2, n)]

# Python handles printing of floating-point arithmetic well enough; see, e.g.,
# "Printing Floating-Point Numbers Quickly and Accurately with Integers". However,
# we can always ask for more.
# See also, https://docs.python.org/3/tutorial/floatingpoint.html.
x = 0.3 * 3 + 0.1
print(x)  ## old Python 2.x would be "%.20f" % x
format(x, ".20f")  ## Python 3.x comes with f-strings: "{:.20f}".format(x)

# To compare floats, it is still possible to mimic C/C++ (f)abs, but PEP485
# introduced handy functions for that matter.
# https://www.python.org/dev/peps/pep-0485/
x = 1e-9
y = 1e-9 + 1e-12
math.isclose(x, y, abs_tol=1e-6)


# Here we use an analytical formula to compute $\sum\_{k=1}^n k^p$, where p=7
# and n=0..10.
def f(n):
    "Sum of 7th powers"
    return 1 / 24 * (3 * n**8 + 12 * n**7 + 14 * n**6 - 7 * n**4 + 2 * n**2)


["%d" % f(i) for i in range(10)]

# Arithmetic and geometric series are more interesting patterns since we can
# rely on generators or the itertools module. See, e.g., this thread on SO:
# https://stackoverflow.com/a/15062050.
x = (2**x for x in range(10))
[x for x in enumerate(x)]

[2**k for k in islice(count(), 5)]


# Catalan numbers
def cn(n):
    val = 1
    for k in range(2, n + 1):
        val = val * (n + k) / k
    return val


["%d" % cn(i) for i in range(2, 15)]
