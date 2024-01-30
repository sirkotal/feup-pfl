/* a) */
list_to(0, []).
list_to(N, [N|Rest]) :-
    N > 0,
    N1 is N - 1,
    list_to(N1, Rest).