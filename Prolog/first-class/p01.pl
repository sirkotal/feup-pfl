% a)

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
| ?- parent(_P, luke), parent(_P, S), S \= luke.*/