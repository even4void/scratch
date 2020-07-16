(import (chicken foreign))

(foreign-declare "#include <math.h>")

(define sin-pi
  (foreign-lambda* double ((double x))
    "double val = x * M_PI;"
    "C_return(sin(val));"))

(display (sin-pi 0.5))
