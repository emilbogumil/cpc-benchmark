#include <iostream>
#include <chrono>
using namespace std;

const int PRIMES_TOP_BOUNDRY = 1001;

int main()
{
    auto t1 = chrono::high_resolution_clock::now();

    bool excluded[PRIMES_TOP_BOUNDRY] = {};
    int currentNum = 2;
    int primeCount = 0;

    for (currentNum; currentNum < PRIMES_TOP_BOUNDRY; currentNum++) {
        if (!excluded[currentNum]) {
            for (int i = currentNum * currentNum; i < PRIMES_TOP_BOUNDRY; i += currentNum) {
                excluded[i] = true;
            }
            primeCount++;
        } 
    }
    
    auto t2 = chrono::high_resolution_clock::now();
    auto duration = chrono::duration_cast<chrono::microseconds>( t2 - t1 ).count();

    cout << "Number of primes: " << primeCount << "\n";
    cout << "Took: " << duration << " microseconds\n";

    return 0;
}