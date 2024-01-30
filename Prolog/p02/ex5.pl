/* a) */

/* i) */
factorial(1, F, F).
factorial(N, Acc, F) :-
    N > 1,
    N1 is N - 1,
    Acc1 is Acc * N,
    factorial(N1, Acc1, F).

/* ii) */
sum_rec(0, X, X).
sum_rec(N, Acc, X) :-
    N > 0,
    N1 is N - 1,
    Acc1 is Acc + N,
    sum_rec(N1, Acc1, X).

sum_rec(N, X) :- sum_rec(N, 0, X).

/* iii) */
pow_tail(_, 0, Acc, Acc).
pow_tail(X, Y, Acc, P) :-
    Y > 0,
    Y1 is Y - 1,
    Acc1 is Acc * X,
    pow_tail(X, Y1, Acc1, P).

pow_rec(X, Y, P) :-
    pow_tail(X, Y, 1, P).

/* iv) */
square_tail(0, Acc, Acc).
square_tail(N, Acc, S) :-
    N > 0,
    Acc1 is Acc + N + N - 1,
    N1 is N - 1,
    square_tail(N1, Acc1, S).

square_rec(N, S) :- square_tail(N, 0, S).  

/* v) */
fibonacci_tail(0, A, _, A).
fibonacci_tail(N, A, B, F) :-
    N > 0,
    N1 is N - 1,
    Sum is A + B,
    fibonacci_tail(N1, B, Sum, F).

fibonacci(N, F) :- fibonacci_tail(N, 0, 1, F).