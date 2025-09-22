#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

// Reprise de la Q 8 du TD1 ´Ecrire un programme doit qui ex´ecute une commande Unix que l’on lui passe en
// param`etre.

int main(int argc, char *argv[])
{
    pid_t pid = fork();
    if (pid < 0)
    {
        perror("Fork failed");
        return 1;
    }
    else if (pid == 0)
    {
        // Child process
        execvp(argv[1], &argv[1]);
        // If execvp returns, an error occurred
        perror("execvp failed");
        exit(1);
    }
    else
    {
        // Parent process
        int status;
        waitpid(pid, &status, 0);
        if (WIFEXITED(status))
        {
            printf("Child exited with status %d\n", WEXITSTATUS(status));
        }
        else
        {
            printf("Child terminated abnormally\n");
        }
    }    
    return 0;
}