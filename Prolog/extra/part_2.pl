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

/* Implement shortest_safe_path(+Origin, +Destination, +ProhibitedNodes, -Path) which returns in Path one of the shortest paths 
(in terms of edges travelled through) between the nodes Origin and Destination while avoiding visiting any node present in the 
ProhibitedNodes list. Only the first result of the predicate is evaluated (backtracking is ignored).
If ProhibitedNodes includes either Origin or Destination, there is no valid path and, therefore, the predicate should fail 
(as it should in every case there isn't a valid path). */
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

/* Implement all_shortest_safe_paths(+Origin, +Destination, +ProhibitedNodes, -ListOfPaths) which returns in ListOfPaths a list with
all the shortest paths between Origin and Destination that don't go through the nodes in ProhibitedNodes.
If there is no valid path, the predicate should fail. */
all_shortest_safe_paths(Origin, Destination, ProhibitedNodes, ListOfPaths) :-
    shortest_safe_path(Origin, Destination, ProhibitedNodes, ShortestPath), !,
    length(ShortestPath, N),
    length(Path, N),
    findall(Path, shortest_safe_path(Origin, Destination, ProhibitedNodes, Path), ListOfPaths).