/* a) */

factorial(0, 1).
factorial(N, F) :-
    N > 0,
    N1 is N - 1,
    factorial(N1, F1),
    F is N * F1.

/* b) */

somaRec(0, 0).
somaRec(N, Sum) :-
    N > 0,
    N1 is N - 1,
    somaRec(N1, Sum1),
    Sum is N + Sum1.