//
// Created by debdutgoswami on 05/02/21.
//
#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/wait.h>

int main() {
    pid_t pid;
    int a=10;
    pid=fork();
    pid=fork();

    if (pid == 0) {
        printf("child process id: %d\n", getpid());
        printf("child parent process id: %d\n", getppid());
        a++;
        printf("child a = %d\n", a);
        printf("child address of a = %d\n", &a);
    } else {
        sleep(1);
        printf("parent's child pid: %d\n", pid);
        printf("parent process id: %d\n", getpid());
        printf("parent parent process id: %d\n", getppid());
        a++;
        printf("parent a = %d\n", a);
        printf("parent address of a = %d\n", &a);

    }
}

