#define MAXSIZE 1048576
#define BLOCK 1048576/16
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <sys/wait.h>
#include <errno.h>

int main()
{
    printf("SALU\n");
    int fd[2];
    char buffer[MAXSIZE];
    pipe(fd);
    if (fork() != 0)
    {
        printf("SALU JE VAIS WRITE HAHAHA\n");
        int done = write(fd[1], buffer, MAXSIZE);
        printf("SALU J4AI WRITE %d\n", done);
        wait(NULL);
    }
    else
    {
        // Processus fils
        int readNum = read(fd[0], buffer, BLOCK);
        while(readNum != 0){
            int readNum = read(fd[0], buffer, BLOCK);
            printf("%d\n", readNum);
            printf("%d\n", errno);
        }
        exit(0);
    }
    printf("SALU\n");
    printf("%d\n", MAXSIZE);
    return 0;
}