---- MODULE ex1 ----
EXTENDS Naturals

CONSTANTS a, b
ASSUME a > 0 /\ b > 0
VARIABLES x, y

\* Initialisation
Init == x = a /\ y = b

\* Actions
Base == x = y /\ x' = x /\ y' = y
Decr == y > x /\ x' = x /\ y' = y - x
Swap == x > y /\ x' = y /\ y' = x

\* Next
Next == Base \/ Decr \/ Swap

\* Invariants
Correct == \A d \in 2..a:
    (a%d = 0 /\ b%d = 0 <=> x%d = 0 /\ y%d = 0)

(* En python, on aurait
def gcd(a, b):
    x, y = a, b
    while x != y:
        if y > x:
            y -= x // Action Decr
        else:
            x, y = y, x // Action Swap
    return x // Action Base
            
def gcd(a, b):
    if a == b: return a
    if b > a: return gcd(a, b - a)
    return gcd(b, a)

*)

====
