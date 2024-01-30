/* a) */
teaches(algorithms, adalberto).
teaches(databases, bernardete).
teaches(compilers, capitolino).
teaches(statistics, diogenes).
teaches(networks, ermelinda).

attends(algorithms, alberto).
attends(algorithms, bruna).
attends(algorithms, cristina).
attends(algorithms, diogo).
attends(algorithms, eduarda).

attends(databases, antonio).
attends(databases, bruno).
attends(databases, cristina).
attends(databases, duarte).
attends(databases, eduardo).

attends(compilers, alberto).
attends(compilers, bernardo).
attends(compilers, clara).
attends(compilers, diana).
attends(compilers, eurico).

attends(statistics, antonio).
attends(statistics, bruna).
attends(statistics, claudio).
attends(statistics, duarte).
attends(statistics, eva).

attends(networks, alvaro).
attends(networks, beatriz).
attends(networks, claudio).
attends(networks, diana).
attends(networks, eduardo).

/* b)
| ?- teaches(C, diogenes).
| ?- teaches(_C, felismina).
| ?- attends(C, claudio).
| ?- attends(_C, dalmindo).
| ?- attends(_C, dalmindo).
| ?- teaches(_C, bernardete), attends(_C, eduarda).
| ?- attends(_C, alberto), attends(_C, alvaro). */

/* c) */
student(X,Y) :- teaches(C, Y), attends(C, X).
teacher(Y, X) :- student(X, Y).
colleague(X, Y) :- attends(C, X), attends(C, Y), X \= Y; teaches(A, X), teaches(B, Y), X \= Y.