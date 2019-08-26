#!/usr/bin/env python3


import numpy as np


def fft(x):
    """1D Cooley-Tukey FFT (https://is.gd/Yr6VcK)."""
    x = np.asarray(x, dtype=float)
    n = x.shape[0]

    if n % 2 > 0:
        raise ValueError("Size of x must be a power of 2")

    even = fft(x[::2])
    odd = fft(x[1::2])
    expt = np.exp(-2j * np.pi * np.arange(n) / n)

    return np.concatenate([even + expt[:n/2] * odd,
                           even + expt[n/2:] * odd])


def fft_test():
    x = np.random.random(1024)
    return np.allclose(fft(x), np.fft.fft(x))


r = fft_test()
print(r)
