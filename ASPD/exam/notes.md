# Fiche de Révision : Algorithmique des Systèmes Parallèles et Distribués (ASPD)

## 1. Modélisation : TLA+, PlusCal et Réseaux de Petri
**Principes Fondamentaux (TLA+) :**
- Un système est modélisé par un état initial (`Init`) et une relation de transition (`Next`) qui décrit le passage de l'état courant (ex: $x$) à l'état suivant ($x'$).
- **Propriété de sûreté (Safety)** : Exprime que "rien de mauvais ne peut arriver" (ex: pas plus d'un processus en section critique).

**Mécanique de PlusCal (Très important pour l'examen) :**
- **Étiquettes = Étapes atomiques** : En PlusCal, chaque étiquette (`A:`, `B:`, `C:`) définit une transition atomique. La variable de contrôle `pc` (program counter) gère la ligne en cours.
- **Entrelacements (Interleavings)** : Entre deux étiquettes d'un même processus, un autre processus parallèle a tout le temps de s'exécuter. Il faut toujours simuler mentalement **tous les chemins (ordres d'exécution) possibles** pour trouver les valeurs d'un `assert.
- **Mots-clés** : `process` (déclare un processus), `await condition` (bloque tant que faux), `assert condition` (vérifie une propriété de sûreté ; stoppe le vérificateur si faux dans au moins un chemin.

**Réseaux de Petri :**
- Composés de places, transitions et jetons. Une transition est activable si les places d'entrée ont le nombre requis de jetons.
- **Invariant de marquage** : Formule prouvant la conservation des ressources (ex: la somme des jetons reste constante).

---

## 2. Temps et Datation Causale
Dans un système réparti, il n'y a **pas d'horloge globale**. On utilise la causalité ($a \rightarrow b$ signifie "$a$ arrive avant $b$").

**Horloges Logiques de Lamport (LC) :**
- **Règles** : 
  1. Événement local : $LC := LC + 1$.
  2. Envoi de message : $LC := LC + 1$, puis on joint $LC$ au message.
  3. Réception : $LC := Max(LC_{local}, LC_{message}) + 1$.
- **Propriété** : Si $a \rightarrow b$, alors $LC(a) < LC(b)$. 
- **Limite** : La réciproque est **fausse**. Deux événements indépendants peuvent avoir la même estampille.

**Horloges Vectorielles (VC) :**
- Créées pour pallier la limite de Lamport. Chaque processus gère un vecteur (tableau) d'horloges.
- À la réception, on prend le maximum composante par composante.
- **Propriété fondamentale** : $a \rightarrow b \iff VC(a) < VC(b)$. Deux événements sont concurrents s'ils ne sont pas comparables.

---

## 3. Algorithmes d'Exclusion Mutuelle
L'objectif est de garantir qu'au plus un processus utilise une ressource partagée (sûreté) de manière équitable, en évitant les blocages.

- **Algorithme de Lamport** : File d'attente répartie. Un accès requiert une diffusion de demande, l'attente des accords de tous, puis un **message explicite de relâchement**. Coût : **$3(N-1)$ messages**.
- **Algorithme de Ricart et Agrawala** : Optimisation de Lamport. Le message de relâchement est supprimé. En sortant de section critique, un processus libère la ressource en envoyant les accusés de réception (accords) qu'il avait mis en attente. Coût : **$2(N-1)$ messages**.
- **Algorithme de Carvalho et Roucairol** : Optimisation de Ricart-Agrawala. Un processus ne demande l'autorisation qu'aux sites qui la lui ont demandée depuis son dernier accès. Coût : **Au plus $2(N-1)$ messages**.
- **Algorithme de Maekawa** : Basé sur des sous-ensembles (partitions) de sites. Coût : environ **$\sqrt{N}$ messages**.

---

## 4. Protocoles de Communication
Le support physique est non fiable (pertes, désordre, duplication). Il faut des protocoles de contrôle :
- **Protocole de Stenning** : Numérotation des trames, attente d'un accusé de réception (ACK) et retransmission en cas de perte.
- **Alternating Bit Protocol (ABP)** : Protocole bidirectionnel avec une **fenêtre de taille 1**. Utilise un bit alterné (0 ou 1) pour numéroter et valider chaque trame.
- **Sliding Window Protocol (SWP)** : Évolution de l'ABP avec une **fenêtre glissante de taille $n$**. Permet d'envoyer plusieurs messages en rafale pour optimiser le débit, la fenêtre avançant lors des réceptions.

---

## 5. Protocoles de Diffusion (Multicast)
- **FBCAST (FIFO)** : Les messages d'un même émetteur sont délivrés dans l'ordre d'envoi.
- **CBCAST (Causalité)** : Utilise les vecteurs d'horloges. Retarde la livraison d'un message jusqu'à ce que tous les messages qui le précèdent causalement soient livrés.
- **ABCAST (Atomique)** : Tous les processus livrent tous les messages exactement dans le même ordre global.

---

## 6. Élection d'un Leader
* **Chang et Roberts (LCR)** : Sur un anneau. Un candidat fait circuler son ID. Si un candidat reçoit un ID plus grand que le sien, il le transmet. S'il reçoit un ID plus petit, il l'élimine. Le processus recevant son propre ID est élu (c'est l'ID maximum).
- **IEEE 1394 (FireWire)** : Sur une arborescence acyclique (suite à un bus reset). En cas de contention (deux nœuds se demandent la main simultanément), ils choisissent aléatoirement un **délai d'attente court ou long** pour casser la symétrie.

---

## 7. État Global et Snapshot (Chandy-Lamport)
Impossible de prendre une photo globale instantanée sans horloge commune. L'algorithme de Chandy-Lamport capture un état global "consistant" :
- **Règle du Marqueur** : Lorsqu'un processus reçoit le message "marqueur" pour la *première fois*, il enregistre son état local, diffuse le marqueur sur tous ses canaux sortants, puis enregistre tous les messages entrants sur ses autres canaux jusqu'à y recevoir un marqueur.

---

## 8. Auto-stabilisation
* **Définition** : Capacité d'un système à converger de lui-même vers une configuration légale en un temps fini, peu importe son état initial arbitraire (suite à une faute transitoire, corruption, etc.), et sans réinitialisation externe.
- **Exemples** : Algorithme de Dijkstra sur anneau (gestion d'un jeton avec les états $0..N$), algorithme de coloriage d'anneau (un nœud change de couleur s'il a la même que son voisin).