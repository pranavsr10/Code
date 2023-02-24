#include <stdio.h>

int main() {
    int n1 = 10;
    int n2 = 123456;

    // Call functions from libfirst.a
    evenorodd(n1);
    count(n2);
    divisible(n1);
    sum(n2);
    return 0;
}

