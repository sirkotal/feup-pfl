max(A, B, C, Max) :-
    A >= B,
    A >= C,
    Max is A.

max(A, B, C, Max) :-
    B > A,
    B >= C,
    Max is B.

max(A, B, C, Max) :-
    C > A,
    C > B,
    Max is C.