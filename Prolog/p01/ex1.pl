/* a) */
female(grace).
female(dede).
female(gloria).
female(barb).
female(pameron).
female(claire).
female(haley).
female(alex).
female(lily).
female(poppy).

male(frank).
male(jay).
male(javier).
male(merle).
male(bo).
male(cameron).
male(manny).
male(joe).
male(mitchell).
male(phil).
male(dylan).
male(luke).
male(rexford).
male(calhoun).
male(george).

parent(grace, phil).
parent(frank, phil).
parent(dede, claire).
parent(dede, mitchell).
parent(jay, claire).
parent(jay, mitchell).
parent(jay, joe).
parent(gloria, joe).
parent(gloria, manny).
parent(javier, manny).
parent(barb, cameron).
parent(barb, pameron).
parent(merle, cameron).
parent(merle, pameron).
parent(phil, haley).
parent(phil, alex).
parent(phil, luke).
parent(claire, haley).
parent(claire, alex).
parent(claire, luke).
parent(mitchell, lily).
parent(mitchell, rexford).
parent(cameron, lily).
parent(cameron, rexford).
parent(pameron, calhoun).
parent(bo, calhoun).
parent(dylan, george).
parent(dylan, poppy).
parent(haley, george).
parent(haley, poppy).

/* b)
| ?- female(haley).
| ?- male(gil).
| ?- parent(frank, phil).
| ?- parent(P, claire).
| ?- parent(gloria, C). 
| ?- parent(jay, _P), parent(_P, GC).
| ?- parent(_P, lily), parent(GP, _P).
| ?- parent(alex, _C). 
| ?- parent(_P, luke), parent(_P, S), S \= luke. */

/* c) */
father(X, Y) :- male(X), parent(X, Y).
mother(X, Y) :- female(X), parent(X, Y).
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).
grandfather(X, Y) :- male(X), grandparent(X, Y).
grandmother(X, Y) :- female(X), grandparent(X, Y).
siblings(X, Y) :- parent(P, X), parent(P, Y), X \= Y.
halfSiblings(X, Y) :- parent(PX, X), parent(PY, Y), PX \= PY, \+ siblings(X, Y).
uncle(X, Y) :- male(X), parent(P, Y), siblings(X, P).
aunt(X, Y) :- female(X), parent(P, Y), siblings(X, P).
cousin(X, Y) :- parent(PX, X), parent(PY, Y), siblings(PX, PY), X \= Y.  

/* d)
| ?- cousin(haley, lily).
| ?- father(F, luke).
| ?- uncle(U, lily).
| ?- grandmother(GM, _GC).
| ?- siblings(S1, S2).
| ?- halfSiblings(HS1, HS2). */

/* e)
wedding(jay, gloria, '2008').
wedding(jay, dede, '1968').
divorce(jay, dede, '2003'). */