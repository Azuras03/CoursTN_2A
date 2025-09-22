#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

/*
Ecrire un programme multido qui ex´ecute au plus cinq fois (dans des processus s´epar´es) une commande Unix
que l’on lui passe en param`etre. Si l’une des ex´ecutions provoque une erreur, il ne faut pas r´ealiser les ex´ecutions
suivantes.
Pour tester votre travail, vous pouvez utiliser la commande ./multido mkdir toto car mkdir toto renvoit un
code d’erreur si le r´epertoire `a cr´eer existe d´ej`a.
*/

int main(int argc, char *argv[])
{
    int max_executions = 5;
    for (int i = 0; i < max_executions; i++)
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
                int exit_status = WEXITSTATUS(status);
                if (exit_status != 0)
                {
                    printf("Command failed with status %d, stopping further executions.\n", exit_status);
                    break;
                }
            }
            else
            {
                printf("Child terminated abnormally, stopping further executions.\n");
                break;
            }
        }
    }
    return 0;
}