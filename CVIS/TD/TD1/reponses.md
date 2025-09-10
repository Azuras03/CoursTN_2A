# TD1 CVIS

## Table des matières

- [TD1 CVIS](#td1-cvis)
  - [Table des matières](#table-des-matières)
  - [Exercice 1](#exercice-1)

**Convention du module** : Pour la résolution, on commence par la taille y, puis x.

## Exercice 1

1) 7x14. Elle est quantifiée sous 11 niveaux de gris. Mais vu qu'on est en binaire, 16 niveaux de gris (entre 8 et 16 en binaire, donc max est 16). On a besoin de 4 bits pour représenter de 0 à 10 sur un ordi.
Log2(Nmax - Nmin) = Log(10-0)
Ou juste 10-0 = dynamique de 10
2) Il apparait rectangulaire parce que les capteurs CCD ou CMOS ne sont pas carrés. Donc ils déforment l'image car ils ont une précision différente en ligne et en colonne. 
Résolution : 
- x = 4 pixels pour 2mm, donc 2 pixels/mm (4/2)
- y = 3 pixels pour 2mm, donc 1.5 pixels/mm (3/2)

Tout ça c'est à cause de Shannon XD

Pour savoir la précision, on fait de l'étalonnage pour déduire les pixels/mm et avoir un référentiel. Par exemple avec un objet de dimension connue.

Résolution imprimante : DPI

Précision : Dimension la plus petite d'objets visible. Par exemple, 2x0.5mm = 1mm

3) i = 3
0 4 9 10 9 8 4 3 2 10 10 8 3 0

I(x,y) = 4 = I(2,1) repère x,y

I(x,y) = 4 = I(1,2) repère i,j (lignes, colonnes)

4) (Voir [ce schéma](schemaEx1.excalidraw))
On dirait qu'il y a deux formes.

5) On prend un seuil et ce qui est en-dessous on réduit pour que ça soit plus sombre et ce qui est au-dessus on augmente. On met le plus grand niveau de gris du fond derrière le seuil et le plus petit niveau de gris de l'objet principal devant le seuil

6) Binarisation -> Détermination d'un seuil:

**Méthodes locales** : Pixel de la ligne ou colonne : Ici on fait sur ligne i
- Une moyenne (=5.7, donc 5)  
- Une médiane (=6)
- En utilisant la dynamique divisée par 2 : 10/2 = 5

**Méthodes globales** : Sur toute l'image
- Moyenne : 2.88 (3)
- Médiane : 1
- Dynamique / 2 = 5
- Histogramme : Observation des pics et des creux
- Otsu : Pas adaptée ici, car l'histogramme est pas bon XD
- Exponential fit : Ca peut **fonctionner** hehe

On voit qu'entre les deux méthodes on a des valeurs différentes, alors que la dynamique reste souvent la même.

7) (Voir [ce schéma](schemaEx1.excalidraw))

8) Voir diapo requantification. Représenter les niveaux dans un espace plus petit. Je réduis les valeurs possibles de niveau de gris.
On peut le faire avec un LUT

Pour la prochaine fois, faire la question 8 dans excalidraw
Et 9 avec la diapo qui convient après égalisation de l'histogramme.