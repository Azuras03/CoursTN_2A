---- MODULE ex4 ----
EXTENDS Integers

CONSTANT x 
VARIABLE y1, y2, z, pc

----
Pre == x \in Int
Post == IF x > 100 THEN z = x - 10 ELSE z = 91
    
ASSUME Pre (* On suppose que x est un entier *)
InvPost == pc = "HALT" => Post

----

Init == 
    /\ pc = "START"
    /\ y1 = 0
    /\ y2 = 0
    /\ z = 0

ActStart == 
    /\ pc = "START"
    /\ y1' = x
    /\ y2' = 1
    /\ UNCHANGED <<z>>
    /\ pc' = "LOOP"

ActLoop == 
    /\ pc = "LOOP"
    /\ (pc' = IF y1 > 100 THEN "l0" ELSE "l1")
    /\ UNCHANGED <<y1,y2,z>>

Act0 == 
    /\ pc = "l0"
    /\ (pc' = IF y2 = 1 THEN "l2" ELSE "l3")
    /\ UNCHANGED <<y1,y2,z>>

Act1 == 
    /\ pc = "l1"
    /\ y1' = y1 + 11
    /\ y2' = y2 + 1
    /\ UNCHANGED <<z>>
    /\ pc' = "LOOP"

Act2 == 
    /\ pc = "l2"
    /\ z' = y1 - 10
    /\ UNCHANGED <<y1,y2>>
    /\ pc' = "HALT"

Act3 ==
    /\ pc = "l3"
    /\ y1' = y1 - 10
    /\ y2' = y2 - 1
    /\ UNCHANGED <<z>>
    /\ pc' = "LOOP"

ActHalt ==
    /\ pc = "HALT"
    /\ UNCHANGED <<y1,y2,z,pc>>

Next == 
    \/ ActStart
    \/ ActLoop
    \/ Act0
    \/ Act1
    \/ Act2
    \/ Act3
    \/ ActHalt

----

TypeOK == 
    /\ {y1, y2, z} \subseteq Int
    /\ pc \in {"START", "LOOP", "l0", "l1", "l2", "l3", "HALT"}

(* Ma version du code TLA+ 
Loopleft == y1' = y1 - 10 /\ y2' = y2 - 1 /\ UNCHANGED <<z, pc>>
Loopright == y1' = y1 + 11 /\ y2' = y2 + 1 /\ UNCHANGED <<z, pc>>
Exit == z' = y1-10
    /\ UNCHANGED <<y1, y2>>
    /\ pc' = "HALT"

Next == IF y1 > 100 THEN Loopleft
        ELSE IF y2 = 1 THEN Loopright
        ELSE Exit
*)
====