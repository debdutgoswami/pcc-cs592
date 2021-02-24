/*
 How To Compile:
    gcc Q3.c -pthread
 */

#include <pthread.h>
#include <stdio.h>
#include <unistd.h>
pthread_mutex_t mutex1 = PTHREAD_MUTEX_INITIALIZER;
int a[5][5], b[5][5], r1, c1, r2, c2;

int xy = 0;
void *func() {
    // mutex lock is a binary semaphore
    // it first checks if it is 1 or not. If 1 then decrement to 0 and proceed else halt the process until it is unlocked (1)
    pthread_mutex_lock(&mutex1);
    int i, j;
    printf("enter matrix 1 (5x5): \n");
    for(i=0;i<5;i++){
        for(j=0;j<5;j++)
            scanf("%d", &a[i][j]);
        printf("\n");
    }
    printf("enter matrix 2 (5x5): \n");
    for(i=0;i<5;i++){
        for(j=0;j<5;j++)
            scanf("%d", &b[i][j]);
        printf("\n");
    }
    pthread_mutex_unlock(&mutex1);
}

void *func1() {
    pthread_mutex_lock(&mutex1);
    int i, j, c[5][5];
    // performing addition
    for (i = 0; i < 5; i++)
        for (j = 0; j < 5; j++)
            c[i][j] = a[i][j] + b[i][j];

    printf("after addition: \n");
    for (i = 0; i < 5; i++) {
        for (j = 0; j < 5; j++)
            printf("%d ", c[i][j]);
        printf("\n");
    }
    pthread_mutex_unlock(&mutex1);
}

int main(void) {
    pthread_t thread1, thread2;
    pthread_create(&thread1, NULL, &func, NULL);
    pthread_create(&thread2, NULL, &func1, NULL);
    pthread_join(thread1, NULL);
    pthread_join(thread2, NULL);
    return 0;
}
