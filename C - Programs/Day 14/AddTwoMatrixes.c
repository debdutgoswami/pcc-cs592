//
// Created by debdutgoswami on 19/02/21.
// Write a C program to create two threads. 1st thread will take input of two matrices and 2nd thread will perform
// addition i.e after 1st thread, 2nd thread will start execution.
//

#include <pthread.h>
#include <stdio.h>
#include <unistd.h>
pthread_mutex_t mutex1 = PTHREAD_MUTEX_INITIALIZER;
int a[10][10], b[10][10], r1, c1, r2, c2;

int xy = 0;
void *func() {
    // mutex lock is a binary semaphore
    // it first checks if it is 1 or not. If 1 then decrement to 0 and proceed else halt the process until it is unlocked (1)
    pthread_mutex_lock(&mutex1);
    int i, j, c[10][10];
    for(i=0;i<10;i++){
        printf("%d\n\n", i);
        xy++;
    }
    pthread_mutex_unlock(&mutex1);
}

void *func1() {
    pthread_mutex_lock(&mutex1);
    printf("%d\n", xy);
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
