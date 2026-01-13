# Mémoire à l'exécution

## Sommaire :

- Chainage statique;
- DISPLAY (ou adresseur);
- Paramètres (par adresse)
  - + Paramètres procéduraux

```
Programme P :
    A: entier
    Procédure R()
        A,D = entier
        P()
    Procedure P()
        B = entier
        Procedure Q()
            C = entier
            C = 3 ; B = 2 ; A = 1 ; D = 4
        Q()
```

Sauvegarder valeur compteur ordinal quand on entre dans une fonction