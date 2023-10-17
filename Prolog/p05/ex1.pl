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

family_member(M) :- parent(M, _C).
family_member(M) :- parent(_P, M).

/* a) */

children(Person, Children) :-
    findall(Child, parent(Person, Child), Children).

/* b) */

children_of([], []).
children_of([Person|Else], [Person-Children|Result]) :- findall(Child, parent(Person, Child), Children), children_of(Else, Result).

/* c) */

family(Family) :- findall(Person, family_member(Person), Family).

/* d) */

couple(Couple) :-
    parent(X, Child),
    parent(Y, Child),
    X @< Y,
    Couple = X-Y.

/* e) */

couple(X, Y) :-
    parent(X, Child),
    parent(Y, Child),
    X @< Y.

couples(List) :- findall(P, couple(X, Y), Couples), sort(Couples, List).