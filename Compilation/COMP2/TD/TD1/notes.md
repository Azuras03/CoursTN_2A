# Mémoire à l'exécution

## Sommaire

- Chainage statique;
- DISPLAY (ou adresse);
- Paramètres (par adresse)
  - - Paramètres procéduraux

``` c
Programme P :                                   (1)
    A: entier
    Procédure R()                               (2)
        A,D = entier
        P()
    Procedure P()                               (3)
        B = entier
        Procedure Q()                           (4)
            C = entier
            C = 3 ; B = 2 ; A = 1 ; D = 4
        Q()
```

Sauvegarder valeur compteur ordinal quand on entre dans une fonction

### Question qui tombera au contrôle

AST : Bloc main
- appel à f(a,b)
- On est dans le code de main et on tombe sur f
- dans la pile, vu qu'on est sur main, c'est l'appelant qui les empile

LR(1) : nombre d'unités lexicales d'avance

Pile programme P

- @retour
- 1                 P
- A

-------

- @retour
- a                 Q



Etc...


### Accès aux variables non locales :

- Via un numéro de région mis en pile
- Via le chainage statique mis en pile
  - Via un DISPLAY

Concernant le ch. STAT :
- 1) Comment trouver la base du bloc de déclaration d'une variable, non locale

On a : 
- A chaque bloc/région est attaché un num d'imbrication (calculé à la compilation mémorisé dans la TDS de la région)
-> Pour trouver la base du bloc de déclaration d'une variable
  - Si cette variable i est déclarée dans un bloc X de numéro d'imbrication Nx
  - Si cette variable i est visible dans un bloc Y de numéro d'imbrication Ny
    - Alors on a : Ny >= Nx (si Nx = Ny, I est une var locale)
      => Il faut "remonter" Ny-Nx ch. statiques depuis l'environnement courant pour avoir la base du bloc qui déclare i.

Mémoriser imbrication, ...


- 2) Comment mettre en place (en pile) le chainage statique?

<u>Hypothèse</u> : 
- L'appelant est un bloc d'imbrication Nx
- L'appelant est un bloc d'imbrication Ny
Soit k : La différence de niveau
- Le chainage statique du bloc <u>appelé</u> dont désigner le (dernier) bloc d'imbrication Ny-1 = Nz
- Depuis l'appelant, on trouve le bloc d'imbrication Nz en faisant (Nx-Nz) parcours de chainages statiques
  - Remonter Nx-Ny + 1 chainages statiques
