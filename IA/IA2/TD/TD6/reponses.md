# TD 6 IA

## Exercice 1

### Question 1

Et = on est garé, état terminal. et on est de 1 à n. 1 = près du cinéma

MDP<S,A,P,C>
- Etats possibles : { E1,...,En,Et }
- Actions : { avancer, garer } 
  - (Et | Ei, ga) -> 0.3
  - (Ei-1 | Ei, ga) -> 0.7  Pour i € [1,n]
  - (Et | E1,ga) -> 1       Pour i = 1
  - (Ei-1 | Ei, av) = 1     Pour tout i
- Coût :
  - c(Ei, ga) = P(Et | Ei, ga) * i/2 + P(Ei-1 | Ei, ga) * 0 = 0,3 * i/2 = 0,15i
  - c(E1, ga) = P(St, E1, ga) * (P(1/2E1, ga, Et) * 1/2 + P(5|E1,ga,Et) * 5) = 1 * (0,3 * 1/2 + O,7 * 5) = 0,15 + 3,5 = 3,65
- Récompenses : { proportionnelle à la distance entre la place de parking p et le cinéma, de récompense p/2 }
- Probabilité : {  }

(reste de l'exercice sur feuille)

## Exercice 2

### Question 1

Etats S = {B, M}
A = {med, nil}

Oui c'est stochastique allez salu

### Question 2

(sur excalidraw)

### Question 3

r(S,a) = P(s'|s,a)r(s,a,s')

r(B,med) = r(B,med,B)P(B|B,med)+r(B,med,M)P(M|B,med) = 0,9 * 0,7 + 0,1 * -0,3 = 0.6
r(B,nil) = ... = 1 * 0.7 = 0.7
r(M,med) = r(M,med,M)P(M|M,med)+r(M,med,M)P(M|M,med) = ... = .2 * .3 + .7 * .8 = .5
r(M,nil) = ... = .1

### Question 4 & 5

€ = 0,6

V0(M) = 0   V0(B) = 0

V1(M) = max{

  - med : r(M,med)+ γ(P(B|M,med)V0(B)+P(M|M,med)V0(M)) 
    - = .5 + .9 * ( .8 * 0 + .2 * 0 ) = .5
  - nil : r(M,nil)+ γ(P(B|M,nil)V0(B)+P(M|M,nil)V0(M))
    - = .1 + .9 * ( .1 * 0 + .9 * 0 ) = .1

} = .5

V1(B) = max{

  - med : r(B,med)+ γ(P(B|B,med)V0(B)+P(M|B,med)V0(M))
    - = .6 + .9 * ( .9 * 0 + .1 * 0 ) = .6
  - nil : r(B,nil)+ γ(P(B|B,nil)V0(B)+P(M|B,nil)V0(M))
    - = .7 + .9 * ( .7 * 0 + .3 * 0 ) = .7

} = .7

||v1-v0|| = max(|v1(B)-v0(B)|,|v1(M)-v0(M)|) = 0.7 > 0.6


V2(M) = max{

  - med : r(M,med)+ γ(P(B|M,med)V1(B)+P(M|M,med)V1(M)) 
    - = .5 + .9 * ( .8 * 0.7 + .2 * 0.5 ) = 1.094
  - nil : r(M,nil)+ γ(P(B|M,nil)V1(B)+P(M|M,nil)V1(M))
    - = .1 + .9 * ( .1 * 0.7 + .9 * 0.5 ) = .568

} = 1.094

V2(B) = max{

  - med : r(B,med)+ γ(P(B|B,med)V1(B)+P(M|B,med)V1(M))
    - = .6 + .9 * ( .9 * 0.7 + .1 * 0.5 ) = 1.212
  - nil : r(B,nil)+ γ(P(B|B,nil)V1(B)+P(M|B,nil)V1(M))
    - = .7 + .9 * ( .7 * 0.7 + .3 * 0.5 ) = 1.276

} = 1.276

||v2-v1|| = max(|v2(B)-v1(B)|,|v2(M)-v1(M)|) = 0.59 < 0.6

Donc on s'arrête à là

### Question 6

{

  - Vs € S
  - Vπ(s) = sum(a; π(s,a)r(s,a) + γ(sum(a',s' ; π(s,a')P(s'|s,a')vπ(s')))) 

}

Donc :

{

  - Vπ(B) = r(B,nil)r(B,nil) + γ(P(B|B,nil)Vπ(B)+P(M|B,nil)Vπ(M))
    - 0.37 * Vπ(B) = .7 + .27 * Vπ(M)
  - Vπ(M) = r(M,nil)r(M,nil) + γ(P(B|M,nil)Vπ(B)+P(M|M,nil)Vπ(M))
    - 0.82 * Vπ(M) = .5 + .72 * Vπ(B)

}

Equations à résoudre :)

## Exercice 3

### Question 1

- S = {A,B,C}
- A = {a1,a2,a3}

### Question 2

(graphe avec transitions partant de B sur [fichier excalidraw](ex3.excalidraw))

### Question 3

- γ = .8
- π0 = (a1,a1,a1)
- π = a1

{

  - Vs € S
  - Vπ(s) = sum(a; π(s,a)r(s,a) + γ(sum(a',s' ; π(s,a')P(s'|s,a')Vπ(s')))) 

}

{

  - Vπ(A) = r(A,a1) + .8 * (P(A|A,a1)Vπ(A) + P(B|A,a1)Vπ(B) + P(C|A,a1)Vπ(C))
    - 22 + .8 * ( 1/2 + 1/4 + 1/4 )
  - Vπ(B) = r(B,a1) + .8 * (P(A|B,a1)Vπ(A) + P(B|B,a1)Vπ(B) + P(C|B,a1)Vπ(C))
    - 32 + .8 ( 1/2 + 0 + 1/2 )
  - Vπ(C) = r(C,a1) + .8 * (P(A|C,a1)Vπ(A) + P(B|C,a1)Vπ(B) + P(C|C,a1)Vπ(C))
    - 20 + .8 ( 1/4 + 1/4 + 1/2 )

}

{

  - -22 = -3/5 * V0(A) + 1/5 * V0(B) + 1/5 * V0(C)
  - -32 = 2/5 * V0(A) + -1 * V0(B) + 2/5 * V0(C)
  - -20 = 1/5 * V0(A) + 1/5 * V0(B) + -3/5 * V0(C)

}


Cela donne une matrice :

```
  = -3/5  1/5   1/5   = -22 
  = 2/5   -1    2/5   = -32 
  = 1/5   1/5   -3/5  = -20 
```
