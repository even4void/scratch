(import (chicken foreign))

(define ilen
  (foreign-lambda* long ((unsigned-long x))
    "unsigned long y;\n"
    "long n = 0;\n"
    "#ifdef C_SIXTY_FOUR\n"
    "y = x >> 32; if (y != 0) { n += 32; x = y; }\n"
    "#endif\n"
    "y = x >> 16; if (y != 0) { n += 16; x = y; }\n"
    "y = x >>  8; if (y != 0) { n +=  8; x = y; }\n"
    "y = x >>  4; if (y != 0) { n +=  4; x = y; }\n"
    "y = x >>  2; if (y != 0) { n +=  2; x = y; }\n"
    "y = x >>  1; if (y != 0) C_return(n + 2);\n"
    "C_return(n + x);"))

(print "Please enter a number")
(print "The length of your integer in bits is " (ilen (read)))
