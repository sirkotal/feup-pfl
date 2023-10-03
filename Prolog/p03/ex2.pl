/* a) */

list_size([], 0).
list_size([H | T], Size) :-
    list_size(T, SizeT),
    Size is SizeT + 1.

/* b) */

list_sum([], 0).
list_sum([H | T], Sum) :-
    list_sum(T, SubSum),
    Sum is SubSum + H.

/* c) */

list_prod([], 1).
list_sum([H | T], Prod) :-
    list_sum(T, SubProd),
    Prod is SubProd * H.

/* d) */

inner_product([], [], 0).
inner_product([H1 | T1], [H2 | T2], Prod) :-
    inner_product(T1, T2, SubProd),
    Prod is H1 * H2 + SubProd.

/* e) */

count(Elem, [], 0). 
count(Elem, [Elem | T], N) :-
    count(Elem, T, N1),
    N is N1 + 1.
count(Elem, [H | T], N) :-
    Elem \= H,
    count(Elem, T, N).