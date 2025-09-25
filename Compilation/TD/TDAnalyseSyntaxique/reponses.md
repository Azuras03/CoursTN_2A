# TD Analyse Syntaxique

### Question 1

Unités lexicales = { **nil** ; **(** ; **)** ; **entier** ; **,** ; **.** }

X -> P

P -> (H)

H -> F,F | F

F -> E.E | E

E -> entier | nil

**Corrigé** :

A -> V | (A.A) | (AS)

V -> entier | nil

S -> ,AS | ^

^ = mot vide

La grammaire n'est pas LL(1). Si on commence avec "(A" on ne sait pas à quel endroit on est (soit (A.A) ou (AS)).

### Question 2

Comment la rendre LL(1) : On regroupe les mêmes préfixes

A -> V | (AX

X -> .A) | S)

V -> entier | nil

S -> ,AS | ^

**Premier**

Premier(A) = {entier; nil; (}

Premier(X) = {. ; )}

Premier(V) = {entier; nil}

Premier(S) = {, ; )}

**Suivant**

Suivant(A) = { ) ; $ ; . ; , }

Suivant(X) = Suivant(A)

Suivant(V) = Suivant(A)

Suivant(S) = { ) }

TASD :

action : 
- développer A->alpha
- TASD($,$) = "OK"
- Pour tout A appartenant à N, A-> alpha, alpha != ^
- TASD(A,b) = "développer A en alpha" A->alpha
  Pour tout b appartenant à Premier(X)

Pour tout A appartenant à N, A -> ^
TASD(A,b) = "Avancer dans la cible" AVC
pour tout b appartient à Suiv(A)


En gros on met les règles suivant qui correspondent aux variables
|     | (   | )   | .   | ,   | entier | nil | $   |
| --- | --- | --- | --- | --- | ------ | --- | --- |
| A   | (AX |     | .   |     | V      | V   |     |
| X   |     | S)  | S)  | S)  |        |     |     |
| S   |     |     | ^   |     | ,AS    |     |     |
| V   |     |     |     |     |        | ent | nil |
|     |     |     |     |     |        |     |     |
| (   | \   |     |     |     |        |     |     |
| )   |     | \   |     |     |        |     |     |
| .   |     |     | \   |     |        |     |     |
| ,   |     |     |     | \   |        |     |     |
| ent |     |     |     |     | \      |     |     |
| nil |     |     |     |     |        | \   |     |
| $   |     |     |     |     |        |     | \   |

AV = avance
C = cible
TS = Texte source

\ = AV C TS

```
Pile        Action      Source
A                       ((1.2),3)
(AX                     (1.2),3)
AX                      
(AXX
AXX                     1.2),3)
...
```

**Ou par fonction récursive** :

- A chaque non terminal A, on va associer une fonction : analyse_A(): bool
- On a 1 fonction lire() qui lit la prochaine unité lexicale
- On a une fonction code_unité() qui retourne le code e l'unité lexicale lue

analyse_V() : 
``` 
    // On met les trucs qu'il analyse. Si c'est un non-terminal, on fait plusieurs clauses pour qu'il aille aux bonnes fonctions
    si code_unite_lex == code_entier ou code_nil :
    alors
        lire()
        return true
    sinon
        ecrire("entier ou nil attendu")
        return false
```

analyse_A():
```
    si (code_unite_lex == code_parenthese_ouvrante) :
    alors
        lire()
        return analyse_A() && analyse_X()
    sinon
        analyse_V()
```

analyse_S():
``` 
    si (code_unite_lex == code_virgule) :
    alors
        lire()
        return analyse_A() && analyse_S()
    sinon
        return true
```

Code global :
```
main()
si Analyse_A():
    alors si code_unite = $ // Caractère de fin de fichier
        alors OK
        sinon ...
```

### Question 3

Quand on rencontre une virgule ("(1,2)"), on remplace par un point ("(1.(2.nil))")



analyse_V() : 
``` 
    // On met les trucs qu'il analyse. Si c'est un non-terminal, on fait plusieurs clauses pour qu'il aille aux bonnes fonctions
    si code_unite_lex == code_entier :
    alors
        lire()
        ecrire("ent")
        return true
    sinon si code_untite_lex == code_nil
        lire()
        ecrire("nil")
        return true
    sinon
        ecrire("entier ou nil attendu")
        return false
```

analyse_A():
```
    si (code_unite_lex == code_parenthese_ouvrante) :
    alors
        lire()
        ecrire("(")
        return analyse_A() && analyse_X()
    sinon
        analyse_V()
```

analyse_S():
``` 
    si (code_unite_lex == code_virgule) :
    alors
        lire()
        ecrire(".(")
        analyse_A()
        analyse_S()
        ecrire(")")
    sinon
        ecrire(".")
        ecrire("nil")
        return true
```

analyse_X():
```
    si (code_unite_lex == code_point):
        lire()
        ecrire(".")
        analyse_A()
        si code_unite_lex == code_parenthese_fermante
            ecrire (")")
            lire()
        sinon
            erreur
    sinon
        analyse_S()
        si code_unite_lex == code_parenthese_fermante
            ecrire (")")
            lire()
        sinon
            erreur
```

Code global :
```
main()
si Analyse_A():
    alors si code_unite = $ // Caractère de fin de fichier
        alors OK
        sinon ...
```

## Analyse syntaxique ascendante

### Exercice 1

A' -> A [r0]

A -> V [r1] | (A.A) [r2] | (AS) [r3]

S -> ,AS [r4] | ^ [r5]

V -> ent [r6] | nil [r7]

SLR(1) ?
- Automate LR(0)
- Table SLR(1)
- Conclusion

**Premier**

Premier(A) = {entier; nil; (}

Premier(X) = {. ; )}

Premier(V) = {entier; nil}

Premier(S) = {, ; )}

**Suivant**

Suivant(A) = { ) ; $ ; . ; , }

Suivant(X) = Suivant(A)

Suivant(V) = Suivant(A)

Suivant(S) = { ) }

Table SLR(1):
- Automate LR(0)
- Table action/transition
- Idem analyse LR(0)
- sauf pour les états de réduction

### Exercice 2

S' -> S
S -> G = D
    D
G -> *d
    idf
D -> G

Est-il SLR(1)?

Création d'automate

Pas possible. Pouvons-nous avoir LR(1)?
- Automate LR(1)
- Table LR(1)