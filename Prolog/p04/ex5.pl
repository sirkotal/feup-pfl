/* a) */

print_n(S, 0) :- !.
print_n(S, N) :-
    write(S),
    NewN is N - 1,
    print_n(S, NewN).

/* b) */

print_string("") :- !.
print_string([C | T]) :- char_code(A, C), write(A), print_string(T). 

print_text(Text, Symbol, Padding) :-
    write(Symbol),
    print_n(' ', Padding),
    print_string(Text),
    print_n(' ', Padding),
    write(Symbol).

/* d) */

read_number(X, X) :- peek_code(10), !.
read_number(In, Out) :-
    get_code(C),
    char_code('0', Z),
    C >= Z,
    Z + 9 >= C,
    NewIn is In * 10 + (C - Z),
    read_number(NewIn, Out).

read_number(X) :- read_number(0, X).

/* e) */

read_until_between(Min, Max, Value) :-
    repeat,
    read_number(Value),
    Value >= Min,
    Max >= Value, 
    !.

/* f) */

read_string([]) :- peek_code(10), !.
read_string([H | T]) :-
    get_code(H),
    read_string(T).