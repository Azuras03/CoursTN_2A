%{
Exercice 1

1) De 0 à 2^4 = 16. Mais de 0 à 16 = 17, donc 0 à 15, car 4bpp + loi
uniforme
2) H = - somme (i=1 à 16) pi log2(pi) = 4 bpp
pi = 1/16 (car loi uniforme)
Cette image a une entropie maximale, donc on ne peut pas la compresser sans
perte, car loi uniforme (tout le monde a autant de chance d'apparaitre,
donc pas de possibilité de compression).
3) QSU 3 niveaux. Donc 3 marches d'escalier. Chaque marche va faire 5, car
3*5 = 15.
De 0 à 5 exclu, on est à Q(x) = 2,5, de 5 à 10 exclu, 7,5, de 10 à 15, 12,5.
Si on trace l'histogramme de l'image, on aura des pics à 2,5 ; 7,5 et à
12,5.
Nombre de 2,5 = 81920
Nombre de 7,5 = 81920
Nombre de 12,5 = 98304

Formule : 5*1/16 * 512²
Pour 12,5, on a le 15 aussi qui est inclu, donc 6*1/16

%}