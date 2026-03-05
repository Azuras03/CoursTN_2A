---- MODULE ex3 ----
EXTENDS TLC, Naturals

CONSTANT X1, X2
ASSUME X1 >= 0 /\ X2 > 0 \* On a choisi d'élargir le domaine de X1 avec 0
VARIABLES Y1, Y2, Y3, Z1, Z2, halt

Init == Y1 = 0 /\ Y2 = 0 /\ Y3 = X1 /\ Z1 = 0 /\ Z2 = 0 /\ halt = FALSE

Exit == Y3 = 0 /\ Z1' = Y1 /\ Z2' = Y2
    /\ UNCHANGED <<Y1, Y2, Y3>>
    /\ halt' = TRUE
Loop ==
    ~ Y3 = 0
    /\ (Y1' = IF Y2+1 = X2 THEN Y1+1 ELSE Y1)
    /\ (Y2' = IF Y2+1 = X2 THEN 0 ELSE Y2+1)
    /\ Y3' = Y3-1
    /\ UNCHANGED <<Z1, Z2, halt>>

Next == Exit \/ Loop

Post == 0 <= Z2 /\ Z2 < X2 /\ X1 = Z1 * X2 + Z2 
Inv == halt => Post
====