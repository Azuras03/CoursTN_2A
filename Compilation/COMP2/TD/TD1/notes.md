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

LR(1) : nombre d'unités lexicales d'avance

Pile programme P

- @retour
- 1                 P
- A

-------

- @retour
