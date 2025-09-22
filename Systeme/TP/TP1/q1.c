#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main()
{
    // Q1
    for (int i = 0; i < 10; i++)
    {
        if (fork() == 0)
        {
            fflush(stdout);
            break;
        }
    }
    for (int i = 0; i < 10; i++)
    {
        printf("%d", getpid() % 10);
        fflush(stdout);
    }
    wait(NULL);
    return 0;
}