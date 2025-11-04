# TD4 : Algorithmes génétiques

## Table des matières

- [TD4 : Algorithmes génétiques](#td4--algorithmes-génétiques)
  - [Table des matières](#table-des-matières)
  - [Exercice 1](#exercice-1)
    - [Question 1](#question-1)
    - [Question 2](#question-2)
  - [Exercice 2](#exercice-2)
    - [Question 1](#question-1-1)
    - [Question 2](#question-2-1)
    - [Question 3](#question-3)
  - [Exercice 3](#exercice-3)
    - [Question 1](#question-1-2)
    - [Question 2](#question-2-2)
    - [Question 3](#question-3-1)
    - [Question 4](#question-4)


## Exercice 1

### Question 1

Bi = bénéfice associé au ième arrondissement
Cij = les arrondissements i et j sont adjacents

- Espace génotypique :
  - G = {0,1}^n ; |G| = 2^n
  - g appartient G, gi = 1 si un magasin est implanté dans l'arrondissement i, 0 sinon

Soit K la matrice n*n tq :
Ki,j = Gj * Cij 
= 1 si l'arrondissement est couvert pas un magasin dans l'arrondissement j
0 sinon

Fonction d'évaluation : 
   ```
   f(g) = Somme des bénéfices pour les arrondissements couverts par les livraisons - coût magasin * nb de magasins
   Donc Somme j [(Vi Kji)*bj - 6gj]
   ```

### Question 2

- Sélection : Proportionnelle au niveau d'adaptation.
Exemple : P = {g1,g2,g3,g4}
f(g1) = 8 (32%)
f(g2) = 5 (20%)
f(g3) = 6 (24%)
f(g3) = 4 (24%)

Faire n tirages avec remise N = 4 fois.
N/2 couples appariés, 2 enfants par couple
-> N enfants pour la génération suivante

- Recombinaison :
  - Enjambement simple, avec probabilité pc (par exemple, pc = 0,7)
  - Pour chaque couple avec une probabilité pc, choisir aléatoirement le point d'enjambement et échanger les morceaux de code.

- Mutation :
  - Mutation d'un gène probabilité mu = 0.01
  - inverser la valeur d'un des gènes (0 si 1, 1 si 0) 

- Critère d'arrêt :
  - Patience npat = 5, au bout de 5 itérataions, si l'évaluation du meilleur élément est le même, on peut s'arrêter.

## Exercice 2

### Question 1

```
G = {H,B,G,D} ^ n*n ou [1:4]^n*n ou {0;1} ^ n*n
|G| = 2^(2n*n) (et peut-être 4^(n*n), à voir)
```

### Question 2

Fonction d'évaluation (naïve UwU) : f(g) = 1 si le robot arrive à destination, 0 sinon
(pas bon, car ça va revenir à faire une recherche aléatoire, pas foufou)
f doit être progressive

Fonction d'évaluation (mini chad) : f(g) = 1/distance de Manhattan entre point d'échec et la sortie
MAIS, parfois il faut accepter de passer par un état intermédiaire moins prometteur pour aller vers un meilleur maximal. Ici on demande de maximiser presque tout le temps. On ne laisse pas suffisamment de chance aux autres candidats qui sont à court terme moins bien mais qui à long terme sont bien meilleurs. Ici l'exploitation est privilégiée par rapport à l'exploration.

Fonction d'évaluation (chad) : f(g) = nombre de cases visitées avant le crash
Ici l'exploration est privilégiée à l'exploitation. Y a aucun indicateur nous disant si on est proche ou pas.

Fonction d'évaluation (giga chad) : combinaison pondérée des fonctions précédentes

### Question 3
Dans le problème de M. Moutarde, la carte était de 7*7, soit 49 cases.
```
|G| = 2^(2*49) = 2^98
```

## Exercice 3

### Question 1

Phénotype = parcours des m véhicules 

### Question 2

Génotype :

G = {9,8,7,**0**,5,6,**0**,1,2,3,4}
0 = valeur séparatrice

gi : numéros des lieux selon leur ordre de desserte, en intercalant m-1 valeurs séparatrices servant à distinguer les parcours de chaque véhicule.

|G| = n!*(m-1 parmi n+m-1)

On a une combinaison car on doit aussi prendre en compte les différentes positions des séparateurs **0**.

### Question 3

Enjambement double, avec probabilité pc. Si recombinaison effective :
- Tirer deux positions aléatoirement (points d'enjambement)
- Echanger les morceaux de code
- Supprimer les gènes superflus et ajouter en fin ceux manquants

### Question 4

On prend le max de la distance des voitures