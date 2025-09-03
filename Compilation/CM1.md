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