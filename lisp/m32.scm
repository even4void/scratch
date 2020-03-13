(import (chicken foreign)
        (chicken format))

#>
  extern uint32_t murmur3_32(const uint8_t* key, size_t len, uint32_t seed);
<#

(define m32 (foreign-lambda unsigned-int32 "murmur3_32" blob size_t unsigned-int32))

(printf "~A " (m32 "murmur" 6 101))
