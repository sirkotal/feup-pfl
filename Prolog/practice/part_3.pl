connected(Person1, Person2):-
    connected2(Person1, Person2),
    Person1 \= Person2.
connected(Person1, Person2):-
    connected2(Person2, Person1),
    Person1 \= Person2.
    
connected2(Person1, Person2):-
    movie(_T, _Y, _S, _D, _Sc, Person1, Person2, _).
connected2(Person1, Person2):-
    movie(_T, _Y, _S, _D, _Sc, Person1, _C, Cast),
    member(Person2, Cast).
connected2(Person1, Person2):-
    movie(_T, _Y, _S, _D, _Sc, _Dir, Person1, Cast),
    member(Person2, Cast).
connected2(Person1, Person2):-
    movie(_T, _Y, _S, _D, _Sc, _Dir, _Comp, Cast),
    member(Person1, Cast),
    member(Person2, Cast).

/* The Bacon number of an actor is the number of degrees of separation he or she has from Kevin Bacon. 
By extending the concept, we can determine the degree of separation between any two people involved in movies (Director, Composer, and Actors). 

Implement connected_degree(+Person1, +Person2, ?Degree), which determines the degree of separation between two people - the minimum 
amount of 'connections' necessary to reach the other person.

Examples:
| ?- connected_degree('Steven Spielberg', 'John Williams', Degree).
Degree = 1 ? 
| ?- connected_degree('Don Davis', 'John Williams', Degree).       
Degree = 2 ? 
| ?- connected_degree('Don Davis', 'Harrison Ford', Degree).       
Degree = 3 ? */
connected_degree(Person1, Person2, Degree):-
	connected_degree_bfs([ [Person1] ], Person2, Degree).

connected_degree_bfs([ [Person1|R] | _], Person1, Degree):- !,
	length(R, Degree).
connected_degree_bfs([ [Person1|R] | T ], Person2, Degree):-
	setof(Next, ( connected(Person1, Next),
		      \+ (member(Next, [Person1|R])) ), List),
	append_all(List, [Person1|R], ToSee),
	append(T, ToSee, NextList),
	connected_degree_bfs(NextList, Person2, Degree).

append_all([], _List, []).
append_all([H|T], List, [ [H|List] |NT]):-
	append_all(T, List, NT).