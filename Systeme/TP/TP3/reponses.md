# TP3 Mémoire

## Exercice 1

### Question 1

Linux nicolaspc 6.1.0-39-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.1.148-1 (2025-08-26) x86_64 GNU/Linux

Linux version 6.1.0-39-amd64 (debian-kernel@lists.debian.org) (gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #1 SMP PREEMPT_DYNAMIC Debian 6.1.148-1 (2025-08-26)

### Question 2

PRETTY_NAME="Debian GNU/Linux 12 (bookworm)"
NAME="Debian GNU/Linux"
VERSION_ID="12"
VERSION="12 (bookworm)"
VERSION_CODENAME=bookworm
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"

Cela donne la version du logiciel

### Question 3

Y a 6 processuers qui sont détectés, car nombre de coeurs je pense

## Exercice 2

### Question 6

Y en a 64

### Question 7

48

### Question 8

    PID COMMAND            VSZ   RSS %MEM
   3378 Isolated Web Co 7524788 542608  7.2
   3140 firefox-esr     12124092 539496  7.2
   3874 code            1461303872 526008  7.0
   1282 plasmashell     4111916 342244  4.5
   3600 code            1481543736 336996  4.5
   3375 Isolated Web Co 2835648 289944  3.8
   1189 kwin_wayland    1911920 250636  3.3
   3310 WebExtensions   23996096 239908  3.2
   5097 Isolated Web Co 2703144 238916  3.1

On a une liste des 10 premières lignes des processus sorted par mémoire vive

VSZ est plus grande que RSS parce que RSS est la mémoire actuelle physique prise et VSZ est la mémoire virtuelle que l'on peut prendre.

[allez voir ici](https://stackoverflow.com/questions/7880784/what-is-rss-and-vsz-in-linux-memory-management)

VSZ - Virtual Set Size

    The Virtual Set Size is a memory size assigned to a process ( program ) during the initial execution. The Virtual Set Size memory is simply a number of how much memory a process has available for its execution.

RSS - Resident Set Size (kinda RAM)

    As opposed to VSZ ( Virtual Set Size ), RSS is a memory currently used by a process. This is a actual number in kilobytes of how much RAM the current process is using.


### Question 9

free -h -s 5

### Question 10

procs ----------mémoire---------- -échange- -----io---- -système- ------cpu-----
 r  b   swpd  libre tampon  cache   si   so    bi    bo   in   cs us sy id wa st
 2  0 181760 932704  64020 1717868    1   14   335    71  750 2092 11  3 87  0  0


## Exercice 3

### Question 13

```
Taille d'un element (sizeof tableElement) = 8 octets
Offset t[0].unInt    =  0 (sizeof = 4)
Offset t[0].unShort  =  4 (sizeof = 2)
Offset t[0].unShort2 =  6 (sizeof = 2)
ru_utime          =        0.102259 s
ru_stime          =        0. 89278 s
ru_utime+ru_stime =        0.191537 s
ru_minflt =    64441
ru_majflt =        0
ru_nswap  =        0
```

### Question 14

```
Taille d'un element (sizeof tableElement) = 12 octets
Offset t[0].unInt    =  0 (sizeof = 2)
Offset t[0].unShort  =  4 (sizeof = 4)
Offset t[0].unShort2 =  8 (sizeof = 2)
ru_utime          =        0. 98707 s
ru_stime          =        0.131873 s
ru_utime+ru_stime =        0.230580 s
ru_minflt =    76477
ru_majflt =        0
ru_nswap  =        0
```
Différence de peu à part taille élément

### Question 15

Table fait 50000000 elem

On a donc 400000000 octets

150000

### Question 16

Ca augmente

### Question 17

Je sais pas

## Exercice 4

### Question 18

   text    data     bss     dec     hex filename
   2129     632 4194336 4197097  400ae9 memVirtuelle

La size est **énorme**. On a 2129 text, 632 data, beaucoup de bss, beaucoup de dec.

Le text est le code écrit

Le segment data c'est la data déjà initialisée (variables globales, statiques)

Le segment bss c'est la data pas encore initialisée (du code)

dec : somme des trois éléments

[allez voir ici !](https://mirzafahad.github.io/2021-05-08-text-data-bss/)

### Question 19

```
NicolasPC:~/Bureau/CoursTN_2A$ cat /proc/11109/maps
562788524000-562788525000 r--p 00000000 103:04 5903444                   /home/nicolas03/Bureau/CoursTN_2A/Systeme/TP/TP3/memVirtuelle
562788525000-562788526000 r-xp 00001000 103:04 5903444                   /home/nicolas03/Bureau/CoursTN_2A/Systeme/TP/TP3/memVirtuelle
562788526000-562788527000 r--p 00002000 103:04 5903444                   /home/nicolas03/Bureau/CoursTN_2A/Systeme/TP/TP3/memVirtuelle
562788527000-562788528000 r--p 00002000 103:04 5903444                   /home/nicolas03/Bureau/CoursTN_2A/Systeme/TP/TP3/memVirtuelle
562788528000-562788529000 rw-p 00003000 103:04 5903444                   /home/nicolas03/Bureau/CoursTN_2A/Systeme/TP/TP3/memVirtuelle
562788529000-562788929000 rw-p 00000000 00:00 0 
5627bda68000-5627bda89000 rw-p 00000000 00:00 0                          [heap]
7fd02201f000-7fd023023000 rw-p 00000000 00:00 0 
7fd023023000-7fd023049000 r--p 00000000 103:04 1180970                   /usr/lib/x86_64-linux-gnu/libc.so.6
7fd023049000-7fd02319f000 r-xp 00026000 103:04 1180970                   /usr/lib/x86_64-linux-gnu/libc.so.6
7fd02319f000-7fd0231f2000 r--p 0017c000 103:04 1180970                   /usr/lib/x86_64-linux-gnu/libc.so.6
7fd0231f2000-7fd0231f6000 r--p 001cf000 103:04 1180970                   /usr/lib/x86_64-linux-gnu/libc.so.6
7fd0231f6000-7fd0231f8000 rw-p 001d3000 103:04 1180970                   /usr/lib/x86_64-linux-gnu/libc.so.6
7fd0231f8000-7fd023205000 rw-p 00000000 00:00 0 
7fd023224000-7fd023226000 rw-p 00000000 00:00 0 
7fd023226000-7fd023227000 r--p 00000000 103:04 1180966                   /usr/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
7fd023227000-7fd02324d000 r-xp 00001000 103:04 1180966                   /usr/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
7fd02324d000-7fd023257000 r--p 00027000 103:04 1180966                   /usr/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
7fd023257000-7fd023259000 r--p 00031000 103:04 1180966                   /usr/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
7fd023259000-7fd02325b000 rw-p 00033000 103:04 1180966                   /usr/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
7fff0e372000-7fff0e776000 rw-p 00000000 00:00 0                          [stack]
7fff0e78b000-7fff0e78f000 r--p 00000000 00:00 0                          [vvar]
7fff0e78f000-7fff0e791000 r-xp 00000000 00:00 0                          [vdso]
```

