def lazy_int(n=0):
    while True:
        yield n
        n += 1


xs = lazy_int()

[next(xs) for _ in range(10)]

squares = (x**2 for x in lazy_int())

next(squares)
next(squares)
next(squares)
next(squares)
