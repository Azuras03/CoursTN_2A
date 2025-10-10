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

S' -> S [r0]
S -> G = D [r1]
    D [r2]
G -> *d [r3]
    idf [r4]
D -> G [r5]

Est-il SLR(1)?

Création d'automate

Pas possible. Pouvons-nous avoir LR(1)?
- Automate LR(1)
- Table LR(1)

### Exercice 1 de retour, mais en ascendant

A' -> A (f0 = {x = depiler; ecrire(x)})
A -> V
    (A.A) (f1 = {x1 = depiler(); x2 = depiler(); empiler("(x2.x1)")})
    (AS)
S -> ,AS
    ^
V -> entier (f2 = empiler(entier))
    nil (f3 = empiler(nil))


#### Si on veut transformer les , par un . :

Arbre syntaxique :

```
            A'
            |
            A
    |   |   |   |
    (   A   S   )
        |   |
        V  ,AS
        |   |   |
            V  ,AS
                ||
                V^
        1 , 2 , 3
```

A' -> A (f0 = {x = depiler; ecrire(x)})
A -> V
    (A.A) (f1 = {x1 = depiler(); x2 = depiler(); empiler("(x2.x1)")})
    (AS) (f1)
S -> ,AS (f1)
    ^   (f3)
V -> entier (f2 = empiler(entier))
    nil (f3 = empiler(nil))

### Nouvel exercice

```
S' -> A     (f0 = dépiler(x); écrire(x))
A -> V
    (C)
C -> A.A    (f5 : f1 de l'exercice précédent)
    L       (f4 : x2 = nil; tant que (sommet(pile) != #) x1 = dépiler(); x2 = "(x1.x2)"  finTant; dépiler() // marqueur ; empiler(x2) )
L -> A      (f3 : x=dépiler();empiler('#');empiler(x))
    L,A     
V -> entier (f1 : empiler(ent))
    nil     (f2 : empiler(nil))
```

AST : (1,2,3)

```
    S'
    |
    A
    |
(   C   )
    |       (ici, on a fini la liste)
    L
   | |
   L,A
   | |
  L,A V
  | |  |
  A V ent
  | |
  V ent
  |
  ent

Pile perso : [1, ]
```

### Exercice 2 : Mots de Dyck

```
LP' -> LP           {écrire(nb_mot), écrire(max_imb)}
LP(1) -> UE LP(2)   {nb_mot(LP1) = 1 + nb_mot(LP2); max_imb(LP1) = MAX(gauche, droit)}
    UE              {nb_mot(LP) = 1 ; max_imb(LP1) = max_imb(UE)}
UE -> (LP)          {max_imb(UE) = max_imb(LP) + 1}
    ()              {max_imb(UE) = 1}
```

**Attributs** :
- **Synthétisés** : ceux dont la valeur à un noeud est déterminée à partir de celles de ses fils.
  - -> Adapté au parcours ASC
- **Hérités** : Ceux dont la valeur est déterminée en fonction des valeurs des attributs du père.
  - -> Adapté au parcours DESC


Attributs : 
- Nombre de mots : **nb_mot**
- Imbrication max : **max_imb**

**AST** de (()) () () (()()) :
```
    LP
UE          LP
(LP)    UE          LP
UE      ()      UE          LP
()              ()          UE
                            (LP)
                        UE      LP
                        ()      UE
                                ()
```

## Arbre syntaxique et ambiguité

Grammaire d'expression

```
E' -> E     [r0]
E -> E O E  [r1]
    entier  [r2]
O -> +      [r3]
    -       [r4]
    *       [r5]
    /       [r6]
```

Ambiguë, car la production E donne E O E au départ, qui contient E.

        E
    E   O   E
    1   +   2


Descendant :

```
E -> entier S
S -> O E S
    ^
```

Toujours ambuguë

Comment rendre la grammaire déterministe ?

Avec ...+5
Dans le cas 0E1**O**3E8 :
Si :
- On a lu + ou -, on réduit (associativité gauche)
- On a lu * ou /, on réduit (priorité)

Avec ...*5
Si :
- On a lu + ou -, on lit (priorité)
- On a lu * ou /, on réduit (associativité)
