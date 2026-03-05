---- MODULE ex2 ----
EXTENDS Naturals

CONSTANT max
VARIABLES n

Init == n = 0

getIn == (n < max) /\ n' = n + 1
getOut == (n > 0) /\ n' = n - 1

Next == getIn \/ getOut

Inv == n \in 0..max

====