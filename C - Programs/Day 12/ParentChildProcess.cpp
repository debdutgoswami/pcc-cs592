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
        printf("************\n");
        printf("child process id: %d\n", getpid());
        printf("child parent process id: %d\n", getppid());
        a++;
        printf("child a = %d\n", a);
        printf("child address of a = %d\n", &a);
        printf("************\n");
    } else {
        sleep(1);
        printf("############\n");
        printf("parent's child pid: %d\n", pid);
        printf("parent process id: %d\n", getpid());
        printf("parent parent process id: %d\n", getppid());
        a--;
        printf("parent a = %d\n", a);
        printf("parent address of a = %d\n", &a);
        printf("############\n");

    }
}

//int main()
//{
//    pid_t  pid;
//    /* fork another process */
//    pid = fork();
//    if (pid < 0) { /* error occurred */
//        fprintf(stderr, "Fork Failed");
//        exit(-1);
//    }
//    else if (pid == 0) { /* child process */
//        execlp("/bin/ls", "ls", NULL);
//    }
//    else { /* parent process */
//        /* parent will wait for the child to complete */
//        wait (NULL);
//        printf ("Child Complete");
//        exit(0);
//    }
//}
