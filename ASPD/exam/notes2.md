#set page(
  paper: "a4",
  margin: (x: 1.5cm, y: 1.5cm)
)
#set text(
  font: "Linux Libertine",
  size: 10.5pt,
  lang: "fr"
)
#set heading(numbering: "1.")
#show heading: set block(above: 1.2em, below: 0.6em)
#set list(indent: 1em, spacing: 0.5em)

#align(center)[
  #text(size: 16pt, weight: "bold")[Fiche de Révision : Algorithmique des Systèmes Parallèles et Distribués (ASPD)]
]
#v(1em)

== Modélisation : TLA+, PlusCal et Réseaux de Petri
*Principes Fondamentaux (TLA+) :*
- Un système est modélisé par un état initial (`Init`) et une relation de transition (`Next`) qui décrit le passage de l'état courant à l'état suivant.
- *Propriété de sûreté (Safety)* : Exprime que "rien de mauvais ne peut arriver" (ex: au plus un processus en section critique) 

*Mécanique de PlusCal (Très important pour l'examen) :*
- *Étiquettes = Étapes atomiques* : En PlusCal, chaque étiquette (`A:`, `B:`) définit une transition atomique  La variable `pc` (program counter) gère la ligne en cours 
- *Entrelacements (Interleavings)* : Entre deux étiquettes d'un même processus, un autre processus parallèle a le temps de s'exécuter. Il faut simuler *tous les chemins possibles* pour évaluer un `assert` 
- *Mots-clés* : `process` (déclare un processus), `await` (bloque tant que la condition est fausse), `assert` (vérifie une propriété de sûreté).

*Réseaux de Petri :*
- Composés de places, transitions et jetons  Une transition est activable si les places d'entrée ont le nombre requis de jetons et les places de sortie ont la capacité suffisante .
- *Invariant de marquage* : Formule prouvant la conservation des ressources d'un réseau .

== Temps et Datation Causale
Dans un système réparti, il n'y a *pas d'horloge globale* . On utilise la causalité ($a -> b$ signifie "$a$ arrive avant $b$") .

*Horloges Logiques de Lamport (LC) :*
- *Règles* : Événement local: $"LC" := "LC" + 1$ ; Envoi de message: on joint $"LC"$ ; Réception: $"LC" := max("LC"_("local"), "LC"_("message")) + 1$ .
- *Propriété* : Si $a -> b$, alors $"LC"(a) < "LC"(b)$ . 
- *Limite* : La réciproque est *fausse*. Deux événements indépendants peuvent avoir la même estampille .

*Horloges Vectorielles (VC) :*
- Créées pour pallier la limite de Lamport . Chaque processus gère un vecteur d'horloges . À la réception, on prend le maximum composante par composante .
- *Propriété fondamentale* : $a -> b <=> "VC"(a) < "VC"(b)$. Deux événements sont concurrents s'ils ne sont pas comparables .

== Algorithmes d'Exclusion Mutuelle
L'objectif est de garantir qu'au plus un processus utilise une ressource partagée (sûreté) de manière équitable .
- *Lamport* : File d'attente répartie. Requiert une demande, l'attente des accords de tous, puis un *message explicite de relâchement* . Coût : *$3(N-1)$ messages* .
- *Ricart et Agrawala* : Optimisation de Lamport. Le message de relâchement explicite est supprimé (libération par envois d'accords différés) . Coût : *$2(N-1)$ messages* .
- *Carvalho et Roucairol* : On ne demande l'autorisation qu'aux sites qui l'ont demandée depuis le dernier accès . Coût : *Au plus $2(N-1)$ messages* .
- *Maekawa* : Basé sur des sous-ensembles (partitions) de sites. Coût : *$approx sqrt(N)$ messages* .

== Protocoles de Communication
Gèrent les canaux non fiables (pertes, désordre) .
- *Protocole de Stenning* : Numérotation des trames, attente d'un accusé de réception (ACK) et retransmission .
- *Alternating Bit Protocol (ABP)* : Fenêtre de *taille 1*. Utilise un bit alterné (0/1) pour valider chaque trame et attente d'un ACK .
- *Sliding Window Protocol (SWP)* : Évolution de l'ABP avec une *fenêtre glissante de taille $n$* . Permet d'envoyer plusieurs messages en rafale pour optimiser le débit .

== Protocoles de Diffusion (Multicast)
- *FBCAST (FIFO)* : Les messages d'un même émetteur sont livrés dans l'ordre d'envoi .
- *CBCAST (Causalité)* : Utilise les vecteurs d'horloges. Retarde la livraison d'un message jusqu'à ce que tous ses précédents causaux soient livrés .
- *ABCAST (Atomique)* : Tous les processus livrent tous les messages exactement dans le même ordre global .

== Élection d'un Leader
- *Chang et Roberts (LCR)* : Sur un anneau. Un candidat fait circuler son ID . Si un candidat reçoit un ID plus grand, il le transmet. S'il reçoit un ID plus petit, il se déclare perdu . Le processus recevant son propre ID (le maximum) est élu .
- *IEEE 1394 (FireWire)* : Sur un réseau en arbre (suite à un bus reset) . En cas de contention (deux nœuds s'envoient une requête simultanément), ils choisissent aléatoirement un *délai d'attente court ou long* pour casser la symétrie .

== État Global et Snapshot (Chandy-Lamport)
Capture un état global "consistant"  car il est impossible de faire une photo instantanée globale :
- *Règle du Marqueur* : Lorsqu'un processus reçoit un marqueur pour la *première fois*, il enregistre son état, diffuse le marqueur sur tous ses autres canaux, puis enregistre les messages entrants sur ses autres canaux jusqu'à y recevoir un marqueur.

== Auto-stabilisation
- *Définition* : Convergence du système vers une configuration légale en un temps fini, peu importe son état initial (suite à une faute transitoire) et sans initialisation externe .
- *Exemples* : Algorithme de Dijkstra sur un anneau , coloriage d'anneau (un nœud change de couleur s'il a la même que son voisin) .