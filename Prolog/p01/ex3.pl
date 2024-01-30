/* a) */
pilot(lamb).
pilot(besenyei).
pilot(chambliss).
pilot(maclean).
pilot(mangold).
pilot(jones).
pilot(bonhomme).

team(lamb, breitling).
team(besenyei, redbull).
team(chambliss, redbull).
team(maclean, mediterranean).
team(mangold, cobra).
team(jones, matador).
team(bonhomme, matador).

plane(lamb, mx2).
plane(besenyei, edge540).
plane(chambliss, edge540).
plane(maclean, edge540).
plane(mangold, edge540).
plane(jones, edge540).
plane(bonhomme, edge540).

circuit(istanbul).
circuit(budapest).
circuit(porto).

win(jones, porto).
win(mangold, budapest).
win(mangold, istanbul).

gates(istanbul, 9).
gates(budapest, 6).
gates(porto, 5).

teamwin(X, Y) :- win(P, Y), team(P, X).

/* b)
| ?- win(P, porto).
| ?- teamwin(X, porto).
| ?- gates(C, 9).
| ?- plane(P, _A), _A \= edge540.
| ?- once((win(P, _C1), win(P, _C2), _C1 \= _C2, pilot(P))).
| ?- plane(_P, A), win(_P, porto). */