#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/wait.h>

int is_prime(int n) {
    for(int i=2; i*i<=n; i++)
        if (n%i == 0)
            return 0;
    return 1;
}

void fibonacci(int n) {
    if (n<=0) return;
    printf("Fibonacci:\n");
    int a = 0, b = 1, count = 2;
    if (n==1) printf("%d\n", a);
    else if (n==2) printf("%d\n%d\n", a, b);
    while (count<=n){
        int c = a+b;
        printf("%d\n", c);
        a = b;
        b = c;
        count += 1;
    }
}

int main(int argc, char *argv[]) {
    //  argv[1] -> n -> fibonacci and check prime
    pid_t pid;
    int n = atoi(argv[1]);
    pid=fork();

    if (pid == 0) {
        // child
        fibonacci(n);
    } else {
        // parent
        if (is_prime(n)) printf("%d is a prime number\n", n);
        else printf("%d is not a prime number\n", n);
    }
}
