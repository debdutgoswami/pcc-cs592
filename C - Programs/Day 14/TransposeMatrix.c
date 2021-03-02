/*
 How To Compile:
    gcc Q3.c -pthread
 */

#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
pthread_mutex_t mutex1 = PTHREAD_MUTEX_INITIALIZER;
int **a, row, col;

int xy = 0;
void *func() {
    // mutex lock is a binary semaphore
    // it first checks if it is 1 or not. If 1 then decrement to 0 and proceed else halt the process until it is unlocked (1)
    pthread_mutex_lock(&mutex1);
    int i, j;
    printf("enter row and column:\n");
    scanf("%d", &row);
    scanf("%d", &col);
    a = (int **)malloc(row * sizeof(int *));
    for (i=0; i<row; i++)
        a[i] = (int *)malloc(col * sizeof(int));
    printf("enter matrix 1: \n");
    for(i=0;i<row;i++){
        for(j=0;j<col;j++)
            scanf("%d", &a[i][j]);
        printf("\n");
    }
    pthread_mutex_unlock(&mutex1);
}

void *func1() {
    pthread_mutex_lock(&mutex1);
    int i, j, c[col][row];
    // performing transpose
    for (i = 0; i < row; i++)
        for (j = 0; j < col; j++)
            c[j][i] = a[i][j];

    printf("after transposing: \n");
    for (i = 0; i < col; i++) {
        for (j = 0; j < row; j++)
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