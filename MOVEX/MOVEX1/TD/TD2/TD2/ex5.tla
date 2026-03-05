---- MODULE ex5 ----
EXTENDS Naturals

prime(n) == 
    /\ n > 1
    /\ \A i \in 2..(n-1) : n % i # 0

CONSTANT x
VARIABLE y,z,pc

----

Pre == x \in Nat \ {0,1}
Post == z = prime(x)

ASSUME Pre
----
Init ==
    /\ pc = "START"
    /\ y = 0
    /\ z = FALSE

ActStart ==
    /\ pc = "START"
    /\ y' = 2
    /\ UNCHANGED <<z>>
    /\ pc' = "LOOP"

ActLoop ==
    /\ pc = "LOOP"
    /\ (pc' = IF y < x THEN "l0" ELSE "l1")
    /\ UNCHANGED <<y,z>>

Act0 == 
    /\ pc = "l0"
    /\ (pc' = IF x%y = 0 THEN "l2" ELSE "l3")
    /\ UNCHANGED <<y,z>>

Act1 ==
    /\ pc = "l1"
    /\ z' = TRUE
    /\ UNCHANGED <<y>>
    /\ pc' = "HALT"

Act2 ==
    /\ pc = "l2"
    /\ z' = FALSE
    /\ UNCHANGED <<y>>
    /\ pc' = "HALT"

Act3 ==
    /\ pc = "l3"
    /\ y' = y + 1
    /\ UNCHANGED <<z>>
    /\ pc' = "LOOP"

ActHalt ==
    /\ pc = "HALT"
    /\ UNCHANGED <<y,z,pc>>

Next ==
    \/ ActStart
    \/ ActLoop
    \/ Act0
    \/ Act1
    \/ Act2
    \/ Act3
    \/ ActHalt

InvPost == pc = "HALT" => z = prime(x)

TypeOK ==
    y \in Nat
    /\ z \in {TRUE, FALSE}
    /\ pc \in {"START", "LOOP", "l0", "l1", "l2", "l3", "HALT"}
----

====