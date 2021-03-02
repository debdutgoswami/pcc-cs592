#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/wait.h>
#include <math.h>

int checkArmstrongNumber(int num) {
    int originalNum, remainder, n = 0, flag;
    double result = 0.0;

    // store the number of digits of num in n
    for (originalNum = num; originalNum != 0; ++n) {
        originalNum /= 10;
    }

    for (originalNum = num; originalNum != 0; originalNum /= 10) {
        remainder = originalNum % 10;

        // store the sum of the power of individual digits in result
        result += pow(remainder, n);
    }

    // condition for Armstrong number
    if (round(result) == num)
        flag = 1;
    else
        flag = 0;
    return flag;
}

int main()
{
    int a=0;
    int isarmstrong=0;
    int p[2];
    pipe(p);

    int pid = fork();

    if(pid < 0)
        exit(1);
    if(pid == 0)
    {
        close(p[1]);

        read(p[0],&a,sizeof(int));
        isarmstrong=checkArmstrongNumber(a);
        if(isarmstrong == 1)
            printf("%d is armstrong \n",a);
        else
            printf("not armstrong \n");

        close(p[0]);
    }
    else
    {
        close(p[0]);

        printf("enter the number: \n");
        scanf("%d",&a);
        write(p[1],&a,sizeof(int));
        wait(0);

        close(p[1]);
    }
    return 0;
}
