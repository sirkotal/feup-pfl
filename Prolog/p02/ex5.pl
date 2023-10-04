/* a) */

factorial(1, F, F).
factorial(N, Acc, F) :-
  N > 1,
  N1 is N - 1,
  Acc1 is Acc * N,
  factorial(N1, Acc1, F).

/* b) */

sum_rec(0, X, X).
sum_rec(N, Acc, X) :-
  N > 0,
  N1 is N - 1,
  Acc1 is Acc + N,
  sum_rec(N1, Acc1, X).

sum_rec(N, X) :- sum_rec(N, 0, X).

/* c) */

pow_tail(_, 0, Acc, Acc).
pow_tail(X, Y, Acc, P) :-
  Y > 0,
  Y1 is Y - 1,
  Acc1 is Acc * X,
  pow_tail(X, Y1, Acc1, P).

pow_rec(X, Y, P) :-
  pow_tail(X, Y, 1, P).
