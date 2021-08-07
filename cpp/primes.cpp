#include <iostream>
#include <chrono>
using namespace std;

const int MAX_PRIME = 1000;

int main()
{
    auto t1 = chrono::high_resolution_clock::now();

    bool excluded[MAX_PRIME + 1] = {};
    int currentNum = 2;
    int primeCount = 0;

    for (currentNum; currentNum <= MAX_PRIME; currentNum++) {
        if (!excluded[currentNum]) {
            for (int i = currentNum * currentNum; i <= MAX_PRIME; i += currentNum) {
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