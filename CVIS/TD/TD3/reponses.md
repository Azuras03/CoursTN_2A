# TD3 : Segmentation

## Table des matières

- [TD3 : Segmentation](#td3--segmentation)
  - [Table des matières](#table-des-matières)
  - [Exercice 1](#exercice-1)
    - [Question 1,2 et 3](#question-12-et-3)
    - [Question 4](#question-4)
    - [Question 5](#question-5)
  - [Exercice 2](#exercice-2)
    - [Question 1](#question-1)
    - [Question 2](#question-2)
    - [Question 4](#question-4-1)

## Exercice 1

### Question 1,2 et 3

4V : 
- O1 : 0 0 0 0 0 0 0 3 3 3 0 3 3 2 2 3 3 2 2 2 2 2 2 2 0 1 1 0 0 1 3 0 0 0 0 0 1 1 1 2 1 2 2 2 2 3 1 2 2 1
- A = rien
- O2 : 0 0 3 3 2 3 3 1 1 2 1 1
- O3 : 0 0 0 0 2 2 2 2
- 2 évidements

8V :
- A = rien
- O1 : 0 0 0 0 0 0 0 6 6 7 6 6 4 5 6 4 4 4 4 4 4 4 3 2 3 2 2 0 0 1 2
- O2 : 0 0 0 0 4 4 4 4
- E1 : 0 6 0 0 2 0 0 6 0 6 4 4 4 2 4 4 6 4 2 2
- E2 : 6 2

Les évidements sont calculés en 4 voisinages peu importe ce qu'on fait avec les objets

Répartition : fond(O1(E1(A),E2),O2)

    fond
O1      O2
E1 E2
A

### Question 4

Les déplacements horizontaux seront appelés dx et dy pour les verticaux.
4V : 
**Périmètres :**
- O1 : 32 dx + 18 dy
- O2 : 4 dx + 8 dy
- O3 : 8 dx + 0 dy

8V :
- O1 : 17 dx + 9 dy + 5 diag
- O2 : 8 dx + 0 dy

**Surfaces :**

**4V :**

O1 : 22pix^2

O2 : (i+1) + (i+1) + 0 + 0 - (i-1) + 0 + 0 + 0 + 0 - (i-1) + 0 + 0 = 2i + 2 - 2i + 2 =  4pix^2

O3 : (i-6) * 5 - (i-6) * 5 = 0

**8V :**

O1 : 68,5pix^2
O2 : 0pix^2

### Question 5

A : Défaut rect de 2mm de large (dx) et 3mm de haut (dy)

Périmètres :

**4V**

- O1 : 118mm (32 * 2 + 18*3)
- O2 : 32mm
- O3 : 16mm

**8V**

diag : racine(dx^2+dy^2) = racine(13)mm

- O1 : 79mm (34 + 27 + 5*racine(13))
- O2 : 16mm

Surfaces :

pix^2 = 6mm^2 (car 2mm*3mm)

**4V**

- O1 : 132mm^2
- O2 : 24mm^2
- O3 : 0

**8V**


- O1 : 411mm^2
- O2 : 0

## Exercice 2

### Question 1

1.1) 
- w1 :
  - Param1 :
    - Inf : 4.9
    - Sup : 7
  - Param2 :
    - Inf : 2.3
    - Sup : 3.3
- w2 :
  - Param1 :
    - Inf : 4.4
    - Sup : 5.4
  - Param2 :
    - Inf : 2.9
    - Sup : 3.9


|     | w1^ | w2^ |
| --- | --- | --- |
| w1  | 10  | 0   |
| w2  | 2   | 8   |

Accuracy (justesse) = 18/20 = 90%

Précision : (nb individus appartenant à la classe prédite correctement)/(nb total d'individus prédits dans la classe)

Rappel : (nb d'individus appartenant à classe prédits correctement)/(nombre total d'individus appartenant réellement à la classe)


Précision :
- w1 : 10/12 = 83% 
- w2 : 8/8 = 100%
Rappel :
- w1 : 10/10 = 100%
- w2 : 8/10 = 80%


### Question 2

On va chercher à faire des centroïdes (back in BUT xd)
Moyennes données sur le sujet pour les centroïdes
Moyenne : w1: 6,10  2,87 | w2 : 4,86 3,31

2.3) Si on choisit un modèle gaussien (moyenne, écart-type). On a donc 4 composantes pour le vecteur. Cela va donner une ellipse pour avoir directement ce qu'il faut.
Il faudra utiliser une autre distance (poids différent en gros)

### Question 4

Si on ajoute les W3, on voit qu'il va y avoir des confusions. Soit les paramètres sont pas les bons pour les différencier, soit on en a pas assez.