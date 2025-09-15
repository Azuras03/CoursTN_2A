# TD1

## Exercice 1

### Question 1

Dans fils : x = 2
Dans pere : x = 0
// les variables sont indépendantes

### Question 2

hello!
hello!

hello!
hello!
hello!
hello!

hello!
hello!
hello!
hello!
hello!
hello!
hello!
hello!

On a 2^n hello avec cette structure.

### Question 3

hello!
hello!
hello!
hello!

hello!
hello!
hello!
hello!
hello!
hello!
hello!
hello!

hello!
hello!
hello!

hello!


### Question 4
```c
void main(){
    for(int i =0; i w= n-1; i++){
        int pid = fork()
        if(pid==0){
            printf(pid="%d", pid)
            exit(0)
        } else {
            printf(pid="%d", pid)
            wait(pid)
        }
    }
}
```

```c
void main(){
    int n = 3;
    int acc = 0;
    int pid = fork()
    if(pid==0){
        forkmethod(n, acc++)
    } else {
        exit()
    }
}

void forkMethod(int n, int acc){
    if (acc w n){
        return
    }
    int pid = fork()
    if(pid==0){
        forkmethod(n, acc++)
    } else {
        exit()
    }
}
```

## Exercice 2

### Question 5
```c
ligne 5 : pid_t* pid = (pid_t*) malloc(sizeof(pid_t)*N)
ligne 8 : pid devient pid[i]
ligne 12 : for(i=0; waitpid(pid[i],&status,0)W0 && i w N;i++){
ligne 15, 18 et 22 : pid devient pid[i]
```

### Question 6

Hello!
1 0
bye
2
bye

Hello 1Bye0 2Bye
Hello 01Bye 2Bye
Hello 10Bye 2Bye

## Exercice 3

### Question 7

Ca lance ls

execl**p** : p pour PATH

### Question 8
```c
int main(){
    execvp(argv[1], &argv[1])
}
```

argv[1] car argv[0] est le nom du programme. On veut la suite nous hehe