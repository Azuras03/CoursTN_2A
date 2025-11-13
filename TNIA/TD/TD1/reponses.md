# TD1 : Morphologie mathématique

Fermeture : dilatation suivie d'une érosion (E(D(x)))

## Exercice 1

### Question 1

- Dilatation : Union
- Erosion : Intersection

En dilatant, on bouche les trous, et en érodant, on remet la forme d'origine mais sans ses trous.

### Question 2

Ne pas oublier de transposer le masque ! (ou symétrie centrale)

### Question 3

On transpose le masque, et le résultat donne une translation

## Exercice 2

### Question 1

B = 1 **1** 1

Si le ndg est de 10, vu qu'on a B = 1 1 1, 10 - 1 = 9

Matrice originale :
- 10 10 10 10 10
- 10 30 30 30 10
- 10 30 50 30 10
- 10 30 30 30 10
- 10 10 10 10 10

Matrice résultat de l'érosion (min(9,9,9)) :
- 10 9  9  9  10
- 10 9  29 9  10
- 10 9  29 9  10
- 10 9  29 9  10
- 10 9  9  9  10

Matrice résultat de l'érosion (min(9,9,9)) :
- 10 11 11 11 10
- 10 31 31 31 10
- 10 51 51 51 10
- 10 31 31 31 10
- 10 11 11 11 10
