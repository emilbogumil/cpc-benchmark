# Speed benchmark for Amstrad CPC
Simple benchmark calculating the number of primes up to 1000.


## What it does
It's using a variant of a sieve algorithm. Starts by excluding the multiplications of 2, then picks the next prime from the non-excluded numbers and repeats the process until it goes through all integers <=1000. In the end it returns the number of found primes (168).

Reference C++ code can be found in `cpp` folder.  

Once code is assembled and binary file is written can be run with primes.bas, which also calculates execution time and displays the results.

## Results
On Amstrad CPC 6128 it takes an average of 0.16s for the code to execute.

For comparison, the compiled c++ program executed on a modern pc (AMD Ryzen 5 3600 running Windows 10) takes around 5 microseconds, that is ca. 32000 times faster.