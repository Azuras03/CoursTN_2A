#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <signal.h>

// Ecrire un programme ne se terminant qu’au cinqui`eme Ctrl-C. avec POSIX



// Signal handler function
void handler() {
    static int count = 0;
    count++;
    printf("Received SIGINT %d time(s)\n", count);
    if (count >= 5)
    {
    printf("ALLE SALU\n");
        exit(0);
    }
}

int main()
{
    struct sigaction act;

    act.sa_handler = handler;
    act.sa_flags = 0;
    sigaction(SIGINT, &act, NULL);

    while (1)
    {
    }

    return 0;
}