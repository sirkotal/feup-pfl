edge(a,b).
edge(a,c).
edge(a,d).
edge(b,e).
edge(b,f).
edge(c,b).
edge(c,d).
edge(c,e).
edge(d,a).
edge(d,e).
edge(d,f).
edge(e,f).

/* 1. */
shortest_safe_path(Origin, Destination, ProhibitedNodes, Path):-
    \+member(Origin, ProhibitedNodes),
    \+member(Destination, ProhibitedNodes),
    bfs([[Origin]], Destination, ProhibitedNodes, InvPath),
    reverse(InvPath, Path).

bfs([[Nf|T]|_], Nf, _, [Nf|T]).
bfs([[Na|T]|Ns], Nf, PNs, Sol):-
    findall(
        [Nb,Na|T],
        (edge(Na,Nb), \+member(Nb, [Na|T]), \+member(Nb, PNs)),
        Ns1),
    append(Ns, Ns1, Ns2),
    bfs(Ns2, Nf, PNs, Sol).

/* 2. */

all_shortest_safe_paths(Origin, Destination, ProhibitedNodes, ListOfPaths) :-
    shortest_safe_path(Origin, Destination, ProhibitedNodes, ShortestPath), !,
    length(ShortestPath, N),
    length(Path, N),
    findall(Path, shortest_safe_path(Origin, Destination, ProhibitedNodes, Path), ListOfPaths).