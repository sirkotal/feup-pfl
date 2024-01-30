/* a) */
invert([], []).
invert([H | T], L) :-
    invert(T, L1),
    append(L1, [H], L).

/* b) */
del_one(Elem, [], []).
del_one(Elem, [Elem | T], T).
del_one(Elem, [H | T], [H | L1]) :-
    H \= Elem,
    del_one(Elem, T, L1).

/* h) */
intersperse(_, [], []).
intersperse(_, [H], [H]) :- !.
intersperse(E, [H | T], [H, E | L]) :-
    intersperse(E, T, L).