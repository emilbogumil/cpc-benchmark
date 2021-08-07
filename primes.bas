10 MEMORY &7FFF
20 LOAD "primes.bin", &8000
30 t1=TIME
40 CALL &8000
50 t2=TIME
60 result=PEEK(&9801)
70 td=INT((t2-t1)/3)
80 PRINT result;"primes found in";td;"* 1/100 s."