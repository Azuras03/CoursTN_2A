Mais MOVEX ça sert à quoi?
Vérification :
Pour valider un programme, on peut : (Pour 2^64 * 2^64 possibilités)
- Tester : en prendre une dizaine pour les tests unitaires
- PBT (Property Based Testing?) : 1000 (Choisir )
- Mais sur certains systèmes critiques, on veut des preuves qui garantissent 100% de réussite.

TLA : Temporal Logic of Actions
On doit faire la modélisation de tout ça.
xN \in 1..(N-1)

Init == ^i€I xi = vi
Act_i == Cond_i ^ ^i€I x_i' = ...
Next == Vj€J Act_j

