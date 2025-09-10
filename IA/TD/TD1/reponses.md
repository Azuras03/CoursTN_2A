# TD1

## Table des matières

- [TD1](#td1)
  - [Table des matières](#table-des-matières)
  - [Exercice 1](#exercice-1)
  - [Exercice 2 :](#exercice-2-)
  - [Exercice 3](#exercice-3)


## Exercice 1

1)  Espace d'Etats : Y = {gauche, droite}^5       s = {P1,P2,P5,P10,PT}

2) - Etat initial : Sinit = (gauche, gauche, gauche, gauche, gauche)
   - Etats finaux : F = {(droite, droite, droite, droite, droite)}

3) Opérateurs :

| Nom         | Paramètres                                         | Préconditions sur E départ S | Effet                                        | Cout     |
| ----------- | -------------------------------------------------- | ---------------------------- | -------------------------------------------- | -------- |
| TraverserGD | i,j € {1,2,5,10}. i=j correspond au cas 1 passager | Pi=Pj=PT=gauche              | Pi <- droite && Pj <- droite && PT <- droite | Max(i,j) |
| TraverserDG | i,j € {1,2,5,10}. i=j correspond au cas 1 passager | Pi=Pj=PT=droite              | Pi <- gauche && Pj <- gauche && PT <- gauche | Max(i,j) |

4) On pourrait appliquer Dijkstra vu qu'on a des coûts. Après on pourrait aussi avec A* si on a une heuristique minorante. Par exemple :
- Temps de traversée max pour les personnes encore à gauche


## Exercice 2 :

1)  Espace d'Etats : Y = Ensemble des matrices 3x3 contenant des valeurs dans [0;8], avec des éléments différents deux à deux
Ou : Ensemble des permutations de 0 à 8

1) |S| = (3x3)! = 9!

2) - Etat initial : Sinit = (1,3,4,8,0,2,7,6,5)
   - Etats finaux : F = {(1,2,3,8,0,4,7,6,5)}

3) Heuristique minorante (déf) : Pour tout s appartenant à S, h(s) <= h*(s) (heuristique réelle)

- h0 = 0. Pour tout état, h0(s) <= h*s
    f = g+h = g

"On peut bouger une tuile de la case A vers la vase B"

Heuristique 1: 
- h1 = nombre de tuiles (!= case vide) mal placées

"On peut bouger une tuile de la case A vers la vase B si A et B sont adjacentes"

- h2 = somme des distances de Manhattan entre chaque tuile mal placée et sa destination (dman(A,B) = |xA-xB|+|yA-yB|)

0 = h0(s) <= h1(s) <= h2(s) <= h*(s)

Donc h2 est la meilleure heuristique. Elle est plus proche de la réalité.

| 1   | 3   | 4   |
| --- | --- | --- |
| 8   | 0   | 2   |
| 7   | 6   | 5   |

Puis on déroule en calculant à chaque fois le h2. Par exemple là il est à 4.
On choisit ensuite le noeuf à développer qui a un f petit

(voir [le schéma](exercice2.excalidraw))

## Exercice 3

1) 
| Arad | Brasov | Bucharest   | Craiova | Dobreta | Eforie | Fagaras   | Giurgiu | Hirsova | Iasi | Lugoj         | Mehadia   | Neamt | Oradea     | Pitesti     | Rimnicu   | Sibiu    | Timisoara | Urzicen | Vaslui | Zerind  | Sommets traites                                 |
| ---- | ------ | ----------- | ------- | ------- | ------ | --------- | ------- | ------- | ---- | ------------- | --------- | ----- | ---------- | ----------- | --------- | -------- | --------- | ------- | ------ | ------- | ----------------------------------------------- |
| 0    | +inf   | +inf        | +inf    | +inf    | +inf   | +inf      | +inf    | +inf    | +inf | +inf          | +inf      | +inf  | +inf       | +inf        | +inf      | +inf     | +inf      | +inf    | +inf   | +inf    | None                                            |
| 0    | +inf   | 130-Arad    | +inf    | +inf    | +inf   | +inf      | +inf    | +inf    | +inf | +inf          | +inf      | +inf  | +inf       | +inf        | +inf      | 140-Arad | 118-Arad  | +inf    | +inf   | 75-Arad | Arad                                            |
| 0    | +inf   | +inf        | +inf    | +inf    | +inf   | +inf      | +inf    | +inf    | +inf | +inf          | +inf      | +inf  | 146-Zerind | +inf        | +inf      | 140-Arad | 118-Arad  | +inf    | +inf   | 75-Arad | Arad, Zerind                                    |
| 0    | +inf   | +inf        | +inf    | +inf    | +inf   | 239-Sibiu | +inf    | +inf    | +inf | +inf          | +inf      | +inf  | +inf       | +inf        | 220-Sibiu | 140-Arad | 118-Arad  | +inf    | +inf   | 75-Arad | Arad, Zerind, Sibiu                             |
| 0    | +inf   | +inf        | +inf    | +inf    | +inf   | 239-Sibiu | +inf    | +inf    | +inf | +inf          | +inf      | +inf  | +inf       | +inf        | 220-Sibiu | 140-Arad | 118-Arad  | +inf    | +inf   | 75-Arad | Arad, Zerind, Sibiu, Brasov                     |
| 0    | +inf   | +inf        | +inf    | +inf    | +inf   | 239-Sibiu | +inf    | +inf    | +inf | 229-Timisoara | +inf      | +inf  | +inf       | +inf        | 220-Sibiu | 140-Arad | 118-Arad  | +inf    | +inf   | 75-Arad | Arad, Zerind, Sibiu, Brasov, Timisoara          |
| 0    | +inf   | +inf        | +inf    | +inf    | +inf   | 239-Sibiu | +inf    | +inf    | +inf | 229-Timisoara | 299-Lugoj | +inf  | +inf       | +inf        | 220-Sibiu | 140-Arad | 118-Arad  | +inf    | +inf   | 75-Arad | Arad, Zerind, Sibiu, Brasov, Timisoara, Lugoj   |
| 0    | +inf   | 450-Fagaras | +inf    | +inf    | +inf   | 239-Sibiu | +inf    | +inf    | +inf | 229-Timisoara | 299-Lugoj | +inf  | +inf       | +inf        | 220-Sibiu | 140-Arad | 118-Arad  | +inf    | +inf   | 75-Arad | Arad, Zerind, Sibiu, Brasov, Timisoara, Fagaras |
| 0    | +inf   | 450-Fagaras | +inf    | +inf    | +inf   | 239-Sibiu | +inf    | +inf    | +inf | 229-Timisoara | 299-Lugoj | +inf  | +inf       | 317-Rimnian | 220-Sibiu | 140-Arad | 118-Arad  | +inf    | +inf   | 75-Arad | Arad, Zerind, Sibiu, Brasov, Timisoara, Rimnian |
| 0    | +inf   | 418-Pitesti | +inf    | +inf    | +inf   | 239-Sibiu | +inf    | +inf    | +inf | 229-Timisoara | 299-Lugoj | +inf  | +inf       | 317-Rimnian | 220-Sibiu | 140-Arad | 118-Arad  | +inf    | +inf   | 75-Arad | Arad, Zerind, Sibiu, Brasov, Timisoara, Pitesti |

*(that's fat XD)*
Mais en gros on déroule en passant à l'état qui a le plus petit coût (non traité)
Dans ce que j'ai écrit c'est pas dans l'ordre du coût, mais bon le principe est là, manque juste de traiter les villes selon leur coût pour être sûr d'avoir une solution optimale à un moment donné.

2) L'heuristique serait que l'on prenne la distance à vol d'oiseau. Elle est donnée en annexe au tableau 1.

3) Arad-Sibin-Rimmicu Vilcea-Pitesti-Bucharest (418)