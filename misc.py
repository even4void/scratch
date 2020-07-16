from math import sqrt, ceil
from itertools import islice, count, imap


def take(n, iterable):
    "Return first n items of the iterable as a list"
    return list(islice(iterable, n))


def nth(iterable, n, default=None):
    "Returns the nth item or a default value"
    return next(islice(iterable, n, None), default)


def ilen(iterable):
    return sum(1 for _ in iterable)


def seq(func, start=0):
    return imap(func, count(start=start))


def digits(n):
    return map(int, list(str(n)))


def divisors(n, small=False):
    d = [x for x in range(1, int(ceil(sqrt(n))) + 1) if (n % x) == 0]
    if not small:
        d.extend(map(lambda x: n / x, d))
    return list(set(d))
