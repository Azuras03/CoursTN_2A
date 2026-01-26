# TD Gestion de mémoire

## Exercice 1

### Question 1

(numéro de page, déplacement dans la page) : 
- Numéro de page : 21 bits
- Offset : 11 bits, car 2Ko = 2^11

### Question 2

Taille mémoire virtuelle : 2^32 = 4Go. Nombre d'entrées : 2^21 (taille globale/taille d'une page)

### Question 3

A -> 4 pages -> 3 cases
B -> 8 pages -> 6 cases

5 + 8 > 8, donc on va réduire proportionnellement

Mémoire :

| 0   | B5  |
| --- | --- |
| 1   | A1  |
| 2   | B3  |
| 3   | B4  |
| 4   | A3  |
| 5   | B0  |
| 6   | B2  |
| 7   | B1  |
| 8   | A2  |

A:

|     | Page | v/i |
| --- | ---- | --- |
| 0   | X    | i   |
| 1   | 1    | v   |
| 2   | 8    | v   |
| 3   | 4    | v   |

- i = invalide
- v = valide

B:

|     | Page | v/i |
| --- | ---- | --- |
| 0   | 5    | v   |
| 1   | 7    | v   |
| 2   | 6    | v   |
| 3   | 2    | v   |
| 4   | 3    | v   |
| 5   | 0    | v   |

## Exercice 2

Fonction à minimiser f(p) = T(p) + F(p)

T(p) = Taille de la Table des Pages par processus

F(p) = Quantité de fragmentation moyenne par processus

T(p) = (2^n/p)*e = taille mémoire globale/taille page

F(p) = p/2

f(p) = (2^n/p)*e + p/2

Pour connaître le min, on dérive et on la met à 0

f'(p) = -((2^n * e)/p^2) + 1/2

f'(p) = 0

-((2^n * e)/p^2) + 1/2 = 0

p^2 * 1/2 = 2^n * e

p^2 = 2^n+1 * e

p = racine(2^n+1 * e)

-> p = racine(2^33 * 2^3) = 2^18 octets

## Exercice 3

Sur Arche

## Exercice 4

### Question 4

Format adresse virtuelle : 20
Offset : 12, car 2^12

2^20 entrées

### Question 5

- Avant : 20 12
- Maintenant : 10 10 12

2^10 d'une part

2^10 * 2^10 = 2^20

Statistiquement parlant, c'est plus petit, car on a 2^20 pour si on avait qu'un niveau. Avec le multi-niveau, on a 2^10+12 = 2^22 = 4Mo

## Exercice 5

### Question 6

200 * sizeof(int) = 8 * 200

| 0   | X    |
| --- | ---- |
| 1   | code |
|     |      |
|     |      |

Tableau A de 100 * 100 = 10^4 int

Quand on fait parcours par ligne, chaque case possède 2 lignes.

2 mineurs, 48 majeurs

Donc 50 défauts

Si on fait parcours par colonne, là on fait un défaut de page tous les 2 accès.