/*
 How To Compile:
    gcc Q3.c -pthread
 */

#include <pthread.h>
#include <stdio.h>
#include <unistd.h>
pthread_mutex_t mutex1 = PTHREAD_MUTEX_INITIALIZER;

int xy = 0;
void *func() {
    // mutex lock is a binary semaphore
    // it first checks if it is 1 or not. If 1 then decrement to 0 and proceed else halt the process until it is unlocked (1)
    pthread_mutex_lock(&mutex1);
    xy++;
    pthread_mutex_unlock(&mutex1);
}

void *func1() {
    pthread_mutex_lock(&mutex1);
    xy++;
    pthread_mutex_unlock(&mutex1);
}

int main(void) {
    printf("BEFORE\naddress: %p\tvalue: %d\n", &xy, xy);
    pthread_t thread1, thread2;
    pthread_create(&thread1, NULL, &func, NULL);
    pthread_create(&thread2, NULL, &func1, NULL);
    pthread_join(thread1, NULL);
    pthread_join(thread2, NULL);
    printf("AFTER\naddress: %p\tvalue: %d\n", &xy, xy);
    return 0;
}
