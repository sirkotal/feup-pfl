/* a) */

factorial(0, 1).
factorial(N, F) :-
    N > 0,
    N1 is N - 1,
    factorial(N1, F1),
    F is N * F1.

/* b) */

sum_rec(0, 0).
sum_rec(N, Sum) :-
    N > 0,
    N1 is N - 1,
    sum_rec(N1, Sum1),
    Sum is N + Sum1.

/* c) */

pow_rec(_, 0, 1).
pow_rec(X, Y, P) :-
    Y > 0,               
    Y1 is Y - 1,  
    pow_rec(X, Y1, P1),  
    P is P1 * X.       
    
/* d) */

square_rec(0, 0).
square_rec(N, S) :-
    N > 0,          
    N1 is N - 1,    
    square_rec(N1, S1), 
    S is S1 + N + N1.

/* e) */

fibonacci(0, 1).
fibonacci(1, 1).
fibonacci(N, F) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fibonacci(N1, F1),
    fibonacci(N2, F2),
    F is F1 + F2.

/* f) */

collatz(1, 0).
collatz(N, Steps) :-
    N > 1,
    N mod 2 =:= 0,       
    N1 is N // 2,       
    collatz(N1, SubSteps),
    Steps is SubSteps + 1. 
collatz(N, Steps) :-
    N > 1,
    N mod 2 =:= 1,        
    N1 is 3 * N + 1,      
    collatz(N1, SubSteps), 
    Steps is SubSteps + 1. 

/* g) */

divisor(X, X) :- !.
divisor(X, Y) :-
    X > Y,
    Y > 1,
    (X mod Y) =\= 0,
    Y1 is Y + 1,
    divisor(X, Y1).

is_prime(X) :- divisor(X, 2).