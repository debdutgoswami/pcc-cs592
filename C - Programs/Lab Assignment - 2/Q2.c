#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/wait.h>
#include<string.h>

int main()
{
    int a=0;
    int isprime=0;
    int p[2];
    pipe(p);

    int pid = fork();

    if(pid < 0)
        exit(1);
    if(pid == 0)
    {
        char str[100];
        close(p[1]);
        read(p[0],str,100);
        int len = strlen(str);
        int alpha=0, dig=0, others=0;
        for(int i=0; i<len; i++) {
            if((str[i] >= 65 && str[i] <= 90) || (str[i] >= 97 && str[i] <= 122))
                alpha++;
            else if(str[i] >=48 && str[i] <=57)
                dig++;
            else
                others++;
        }
        printf("alphabets= %d \n", alpha);
        printf("digits= %d \n", dig);
        printf("special characters= %d\n", others);
        close(p[0]);
    }
    else
    {
        char str[100];
        close(p[0]);
        printf("enter the string: \n");
        scanf("%s",str);
        write(p[1], str, 100);
        close(p[1]);
    }

    return 0;
}