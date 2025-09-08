# Compilation CM1

Diff compilateur interpreteur
Comp : Traduit lang 1 en lang2
Inter : On a des données, l'interprête en langage 1 et lui donne à la fin des résultats. On n'a pas de langage, juste ça produit un résultat, mais pas un code. Ligne par ligne, les unes après les autres
L'interprête décode les instructions et retrouve l'adresse des variables et fait "le calcul". Loop infinie

Java : Prog source .java - compiler (javac) - bytecode .class - interprete (java) - sortie


### Structure complète d'un compilateur : 

**Front-end** : Source - automates finis : lexeur (tokens, unités lexicales) lex - grammaire : parser (phrases) asc (Yacc) ou desc (Antlr) - actions sémantiques (arbre syntaxique) - 

**Coeur** = table des symboles : analyse sémantique (typages) qui donne un arbre abstrait - traduction en langage intermédiaire - optimisations

LI Optimisé - 

**Back-end** = génération de code assembleur - optimisations possibles - code objet - editions de liens - langage cible

### Analyse lexicale

- Automate fini, déterministe
- Le seul "module" qui lit le texte source
- Lecture char par char
- Reconnait les **unités lexicales** qui sont les **mots du langage** et les présente au **parser**


### Unités lexicales

**Fixes :**
+ - *
( ) ; { }
if then else

**Génériques :**
identificateurs : x, y, factorielle
constantes numériques

#### Rôle

- reconnaire les tokens
- supprimer les espaces, tab, les commentaires, etc
- indiquer les erreurs lexicales

Ils sont codés, comme un split en gros

|a| |+| |x|
(257, "a"), code ASCII +, (257, "x")
257 : code ASCII de l'identificateur pour analyser simplement

Lexique (identificateurs) :
0: "a"
1: "x"
...
n:

# LE MOT VIDE N'EST PAS UNE UNITE LEXICALE
Parce qu'on ne peut pas analyser le mot vide seulement

### Analyseur syntaxique

But : 
- vérifier syntaxe du programme
- Trouver les erreurs syntaxiques

Analyseur descendant : Si c'est ambigue, c'est compliqué d'analyser. Elle doit être LL(1).

Annalyseur ascendant : On part du mot analysé et on replace des morceaux de texte itérativement. On voit que les tokens déjà analysés correspondent à un membre droit d'une production. Donc on construit un morceau d'arbre syntaxique. Si à la fin on arrive à un axiome, c'est gagné

### Lire ou réduire ?

Etat : Etat est composé d'items obtenus par fermeture

Item : Une production avec un . dans la partie droite

A - aBc donne 4 items : 

A - .aBc
A - a.Bc
A - aB.c
A - aBc.

Fermeture : Ensemble d'items construit à partir de I,
- placer chaque item de I dans Fermeture(I)
- si [A - alpha.B bêta] appartient à Fermeture(I) et [B - gamma]
- alors ajouter [B - .gamma] à Fermeture(I) sauf si déjà dedans


Exemple : 
S' - S
S - Ac
A - AaAb
    d

#### Automate LR(0)

I0 : 
S' - .S
S - .Ac
A - .AaAb
    .d

Si transition dans S :
I1 :
S' - S. (état terminé)

Si transition sur A :
I2 : 
S - A.c
A - A.aAb (pas de fermeture, parce que les points sont derrière aucun non terminal)

Si transition dans d:
I3 :
A - d.

Puis on continue l'automate. Il sera fini et déterministe (LR(0))