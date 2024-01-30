/* a) */
list_append([], L, L).
list_append([X|L1], L2, [X|L3]) :-
    list_append(L1, L2, L3).

/* b) */
list_member(Elem, List) :-
    append(_, [Elem|_], List).

/* c) */
list_last(List, Last) :-
    append(_, [Last], List).

/* e) */
list_append([], []).
list_append([X|Xs], List) :-
    append(X, Rest, List),
    list_append(Xs, Rest).
