from sympy import isprime


def isperm(a, b):
    return sorted(str(a)) == sorted(str(b))


a, f = 1487, 1
d = 3330
while True:
    a += 3-f
    f = -f
    b, c = a+d, a+2*d
    if all(elt is True for elt in map(isprime, [a, b, c])) and \
       isperm(a, b) and isperm(b, c):
        break

print(str(a)+str(b)+str(c))
