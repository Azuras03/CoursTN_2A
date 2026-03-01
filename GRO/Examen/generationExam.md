
--------------------------------------------------------------------------------
SUJET TYPE D'EXAMEN : Graphes et Recherche Opérationnelle 1 (GRO-1)
Durée : 1h15 Documents autorisés : Une antisèche A4 manuscrite (recto et verso). Calculatrice : Autorisée (collège/lycée standard).

--------------------------------------------------------------------------------
Exercice 1 : Modélisation (environ 25 min)
Cet exercice évalue votre capacité à traduire un problème industriel en langage mathématique (Source
, TD1).
Une entreprise de menuiserie fabrique deux types de meubles : des Tables et des Armoires. La fabrication nécessite du bois et des heures de main-d’œuvre (assemblage et finition).
• Une table nécessite 2 unités de bois, 3 heures d'assemblage et 1 heure de finition.
• Une armoire nécessite 3 unités de bois, 2 heures d'assemblage et 2 heures de finition.
L'entreprise dispose par semaine de :
• 60 unités de bois.
• 80 heures pour l'assemblage.
• 40 heures pour la finition.
Le profit net est de 50 € par table et 70 € par armoire. De plus, pour des raisons logistiques, l'entreprise ne peut pas fabriquer plus de 15 armoires par semaine.
1. Définir les variables de décision de ce problème.
2. Écrire la fonction objectif à maximiser.
3. Écrire l'ensemble des contraintes linéaires sous forme d'inégalités.
4. Donner l'écriture matricielle compacte de ce programme linéaire sous la forme max{c⊤x:Ax≤b,x≥0} en explicitant les matrices A,b et c.

--------------------------------------------------------------------------------
Exercice 2 : Résolution de PL et Méthode du Simplexe (environ 25 min)
Cet exercice porte sur la manipulation des dictionnaires et l'algorithme du simplexe (Source
, TD2 Ex 6).
Soit le programme linéaire suivant sous forme canonique :  

$$
\begin{aligned} 

\max \quad & z = 3x_1 + 2x_2 \\
\text{s.c.} \quad & x_1 + x_2 \le 4 \\
& 2x_1 + x_2 \le 6 \\
& x_1, x_2 \ge 0 

\end{aligned}
$$

1. Mettre ce problème sous forme standard en introduisant les variables d'écart nécessaires (e1​,e2​).
2. Écrire le dictionnaire initial associé à la base constituée des variables d'écart.
3. En appliquant la règle du coût réduit le plus grand (règle de Dantzig), quelle variable doit entrer en base ? Quelle variable doit sortir de la base ? Justifiez votre choix par le calcul des ratios.
4. Effectuer le pivotage (mise à jour) et écrire le nouveau dictionnaire.
5. La solution obtenue dans ce nouveau dictionnaire est-elle optimale ? Justifiez.

--------------------------------------------------------------------------------
Exercice 3 : PLNE et Séparation et Évaluation (environ 25 min)
Cet exercice teste la compréhension de la relaxation et de la méthode Branch & Bound (Source
,
, TD3 Ex 3).
On souhaite résoudre le problème de sac-à-dos suivant où les variables xi​ sont binaires (xi​∈{0,1}) :
$$
\begin{aligned}
\max \quad & Z = 16x_1 + 12x_2 + 9x_3 \\
\text{s.c.} \quad & 4x_1 + 3x_2 + 3x_3 \le 6 \\
& x_i \in \{0, 1\}, \quad \forall i \in \{1, 2, 3\}
\end{aligned}
$$
1. On appelle (P0​) le problème relaxé (où 0≤xi​≤1). En utilisant l'heuristique gloutonne basée sur le ratio utilité/poids (Source
), déterminer la solution optimale du problème relaxé (P0​). Quelle est la valeur de la fonction objectif Zrelax​ ?
2. Cette solution relaxée est-elle réalisable pour le problème entier ?
3. Débutez un arbre de Séparation et Évaluation (Branch & Bound) :
    ◦ Séparez le problème (P0​) sur la variable fractionnaire trouvée en 1.
    ◦ Créez deux nœuds : l'un avec xi​=0, l'autre avec xi​=1.
    ◦ Calculez la solution réalisable et la valeur de Z pour chacun de ces deux nœuds.
4. Quelle est la solution optimale entière finale ?

--------------------------------------------------------------------------------
Conseils de révision (basés sur vos sources)
Pour réussir cet examen de 1h15, voici comment cibler vos révisions à partir des feuilles de TD fournies dans les sources :
• Partie Modélisation (Feuille 1) :
    ◦ Refaites l'Exercice 1 (Problème de production)
 : C'est la base absolue. Comprendre comment passer du texte aux équations est indispensable pour l'Exercice 1 de l'examen.
    ◦ Regardez l'Exercice 6 (Vols charter)
 ou l'Exercice 3 (Stockage)
 pour vous habituer à manipuler des variables binaires (0 ou 1), souvent utilisées pour dire "on fait" ou "on ne fait pas".
• Partie PL et Simplexe (Feuille 2) :
    ◦ L'Exercice 6 (Produits P1...P4)
 est crucial. Il vous demande de modéliser puis de résoudre avec la méthode des dictionnaires. C'est exactement ce qui est attendu dans l'Exercice 2 de l'examen type.
    ◦ L'Exercice 7 (Différents déroulements)
 est excellent pour apprendre à lire un dictionnaire final (savoir si on a fini, si c'est infini, etc.) sans faire tous les calculs.
• Partie PLNE (Feuille 3) :
    ◦ Faites l'Exercice 3 (Sac à dos)
. Il couvre la relaxation (ignorer les contraintes d'intégrité) et la séparation (créer l'arbre). C'est le cœur de l'Exercice 3 de l'examen.
    ◦ L'Exercice 1
 est utile pour comprendre graphiquement pourquoi la solution entière n'est pas juste l'arrondi de la solution continue.