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
