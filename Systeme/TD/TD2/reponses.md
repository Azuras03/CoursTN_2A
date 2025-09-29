# TD2 : I/O

## Exercice 1

### Question 1

| toto.txt existe | oui | oui        | non       | non        |
| --------------- | --- | ---------- | --------- | ---------- |
| titi.txt existe | oui | non        | oui       | non        |
| fd2             | 3   | -1         | 3         | -1         |
| errno           | 0   | ENOENT (2) | EBADF (9) | ENOENT (2) |

Pour le 3ème, f1 va être -1. Donc close(-1) retourne une erreur

On a les 0 1 et 2 qui sont alloués par stdin, stdout et stderr.

### Question 2

1) L
2) A
3) A

## Exercice 2

### Question 3

```c
int main(void){
    int fd = open("calculs.txt", O_RDONLY, 0)    // open
    if(fd < 0) {
        perror("open");
        exit(1);
    }
    if (dup2(fd, 0) < 0){ // 0 est stdin
        perror("dup2")
        close(fd);
        exit(2);
    }
    char* c;
    read(fd,&c)
    close(fd)
    execlp("bc", "bc", NULL)
}
```

## Exercice 3

(Sur Arche)

## Exercice 4

### Question 6

