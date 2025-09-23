# TD2 CVIS : Prétraitements

## Exercice 1

1) Formule générale de la convolution de l'image : (M*I) (x,y) = Somme i = -inf +inf Somme j = -inf +inf I(x-i,y-j)
Filtre moyenneur M = 1 de 3x3.
Pour faire le calcul, on tourne le filtre verticalement et horizontalement, puis on calcule ix100, gx100, etc
Ex : matrice F =
a b c
d e f
g h i

tournée :
i h g
f e d
c b a

M =
1/9 1/9 1/9
1/9 1/9 1/9
1/9 1/9 1/9

Toujours penser à le normaliser, donc mettre 1/n en fonction de la somme des cellules.

Donc I =
100 100 100 100 100 100 100 100 100 100 100
100 100 100 10  100 100 100 200 100 100 100
100 100 100 100 100 100 100 100 100 100 100

Devient =
100 100 90  90  90  100 111 111 111 100 100
100 100 90  90  90  100 111 111 111 100 100
100 100 90  90  90  100 111 111 111 100 100

Pour les bords et les angles, on peut dupliquer les bords pour garder la même image.

Le filtre moyenneur moyenne, floute les choses. Quand c'est bruité on atténue le bruit, on le rend moins agressif. Mais parfois non

2) Pour l'image originale, on passe de 100, tout à coup à 10 puis revient à 100.
   Pour l'image moyennée, on passe de 100 à 90 sur 3 pixels qui plus est. Puis revient à 100.

## Exercice 2

1)  La transformation correspond à une mise en valeur des bords, en fonction de l'orientation donnée. Filtre passe-haut qui détecte les contours. Vu que les contours sont des hautes fréquences et qu'il laisse passer que ça, et bah voilà hehe.
Le Sud détecte les contours horizontaux. L'Est les contours verticaux.

Préwitt Est :
-1 0 1
-1 0 1
-1 0 1

2)  On n'oublie pas de normaliser les masques et de retourner le masque pour faciliter le calcul. Mais ici la somme du masque est : -1 -1 -1 +1 +1 +1 = 0. Donc pas besoin de normaliser.
```
Préwitt : Pixel à 5 = -(3) - (6) - (7) +(1) + (2) + (4)= 5/9

Sobel : Pixel à 5 = -(3) - (6) - (7) +(1) + (2) + (4) = -1
```

| Masque  | Sud | Est | Module | Angle Est par rapport à Sud |
| ------- | --- | --- | ------ | --------------------------- |
| Prewitt | 9   | -12 | 21     | Arctan(9/12) = 37°         |
| Sobel   | 13  | -17 | 30     | 37,4°                       |

Calcul du module : valeur absolue de la somme des coefficients

3) Le pixel encadré correspond à une transition


## Exercice 3

1) 
Matrice ligne de l'image originale : 
```
(4  3   4   5   25  30  28  25  24  5   6   4   6   3   4   4)
```
Utilisation du filtre F = (-1 0 1)
Ligne résultante (PAS oublier de retourner le filtre) =
```
(0  0   -2  -21 -25 -3  5   4   20  18  1   0   1   2   -1  0)
```
Le traitement appliqué correspond à l'analyse des augmentations. Les réductions sont en négatif et les augmentations sont bien présentes.

2) 
Module point n°4 : 30
Module point n°5 : 35
Module point n°9 : 28
Module point n°10 : 25

Avec le filtre on fait seulement ressortir les contours.

## Exercice 4

i1 = (255 255 255 255 0 2 255 255 0 255)
Il faut réordonner le filtre médian et trouver la valeur médiane :
Par exemple avec le centre à 0 : 0 0 0 0 **2** 255 255 255 255
Donc la valeur à mettre au milieu est 2
résultat = (255 255 255 255 2 2 255 255 0 255)
résultat i2 = (255 255 1 0 0 0 0 0 255 255)

Commentaire : Avec le filtre médian, on peut retirer les valeurs aberrantes en regardant le voisinage. Donc ça peut par exemple retirer le bruit impulsionnel (poivre et sel)