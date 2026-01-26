#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main(int argc, char *argv[])
{
    // Q2 Structure en chaine
    int n = atoi(argv[1]);
    // printf("pid = %d\n", getpid());
    // printf("ppid = %d\n", getppid());
    // for (int i = 0; i < n; i++)
    // {
    //     if (fork() == 0)
    //     {
    //         printf("pid = %d\n", getpid());
    //         printf("ppid = %d\n", getppid());
    //         fflush(stdout);
    //         exit(0);
    //     }
    //     else
    //     {
    //         wait(NULL);
    //     }
    // }

    // Q2 Structure en arbre
    printf("pid = %d\n", getpid());
    printf("ppid = %d\n", getppid());
    for (int i = 0; i < n; i++)
    {
        pid_t pid = fork();
        if (pid == 0)
        {
            // Child process
            printf("pid = %d\n", getpid());
            printf("ppid = %d\n", getppid());
            fflush(stdout);
        }
        else
        {
            // Parent process
            wait(NULL);
            exit(0);
            break;
        }
    }
    return 0;
}