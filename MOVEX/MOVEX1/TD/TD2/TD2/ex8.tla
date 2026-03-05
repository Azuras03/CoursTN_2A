---- MODULE ex8 ----
EXTENDS TLC, Integers

CONSTANTS x0, y10, y20, y30, z0

(*--algorithm ex8
variables x = x0, y1 = y10, y2 = y20, y3 = y30, z = z0
define 
Pre == 
    /\ x0 \in Nat
    /\ {y10, y20, y30, z0} \in Int

Post == 
    /\ z^2 <= x
    /\ (z+1)^2 > x
    
Annot0 ==
    /\ Pre
    /\ x = x0
    /\ y = y10
    /\ y2 = y20
    /\ y3 = y30
    /\ z = z0

Annot1 ==
    /\ Pre
    /\ x = x0
    /\ z = z0
    /\ y2 = (y1+1)^2
    /\ y3 = 2*y1+1
    /\ y1^2 <= x

Annot2 == Annot1

Annot3 == Annot1

Annot4 == Annot1 /\ y2 > x

Annot5 == Post

end define;
begin
l0:
    y1 := 0;
    y2 := 1;
    y3 := 1;
l1: while y2 <= x do
    l2: 
        y1 := y1+1;
        y2 := y2+y3+2;
        y3 := y3+2;
    l3: skip;
end while;
l4: z := y1;
l5: skip;
end algorithm;*)

\* BEGIN TRANSLATION
VARIABLES pc, x, y1, y2, y3, z

(* define statement *)
Pre ==
    /\ x0 \in Nat
    /\ {y10, y20, y30, z0} \in Int

Post ==
    /\ z^2 <= x
    /\ (z+1)^2 > x

Annot0 ==
    /\ Pre
    /\ x = x0
    /\ y = y10
    /\ y2 = y20
    /\ y3 = y30
    /\ z = z0

Annot1 ==
    /\ Pre
    /\ x = x0
    /\ z = z0
    /\ y2 = (y1+1)^2
    /\ y3 = 2*y1+1
    /\ y1^2 <= x

Annot2 == Annot1

Annot3 == Annot1

Annot4 == Annot1 /\ y2 > x

Annot5 == Post


vars == << pc, x, y1, y2, y3, z >>

Init == (* Global variables *)
        /\ x = x0
        /\ y1 = y10
        /\ y2 = y20
        /\ y3 = y30
        /\ z = z0
        /\ pc = "l0"

l0 == /\ pc = "l0"
      /\ y1' = 0
      /\ y2' = 1
      /\ y3' = 1
      /\ pc' = "l1"
      /\ UNCHANGED << x, z >>

l1 == /\ pc = "l1"
      /\ IF y2 <= x
            THEN /\ pc' = "l2"
            ELSE /\ pc' = "l4"
      /\ UNCHANGED << x, y1, y2, y3, z >>

l2 == /\ pc = "l2"
      /\ y1' = y1+1
      /\ y2' = y2+y3+2
      /\ y3' = y3+2
      /\ pc' = "l3"
      /\ UNCHANGED << x, z >>

l3 == /\ pc = "l3"
      /\ TRUE
      /\ pc' = "l1"
      /\ UNCHANGED << x, y1, y2, y3, z >>

l4 == /\ pc = "l4"
      /\ z' = y1
      /\ pc' = "l5"
      /\ UNCHANGED << x, y1, y2, y3 >>

l5 == /\ pc = "l5"
      /\ TRUE
      /\ pc' = "Done"
      /\ UNCHANGED << x, y1, y2, y3, z >>

(* Allow infinite stuttering to prevent deadlock on termination. *)
Terminating == pc = "Done" /\ UNCHANGED vars

Next == l0 \/ l1 \/ l2 \/ l3 \/ l4 \/ l5
           \/ Terminating

Spec == Init /\ [][Next]_vars

Termination == <>(pc = "Done")

\* END TRANSLATION
InvAnnot ==
    /\ pc = "l0" => Annot0
    /\ pc = "l1" => Annot1
    /\ pc = "l2" => Annot2
    /\ pc = "l3" => Annot3
    /\ pc = "l4" => Annot4
    /\ pc = "l5" => Annot5

PartialCorrect == pc = "Done" => Post

TypeOK == {}
====
