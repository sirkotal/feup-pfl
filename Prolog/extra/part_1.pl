:- dynamic round/4.

/* round(RoundNumber, DanceStyle, Minutes, [Dancer1-Dancer2 | DancerPairs])
   round/4 indica, para cada ronda, o estilo de dança, a sua duração, e os pares de dançarinos participantes. */
round(1, waltz, 8, [eugene-fernanda]).
round(2, quickstep, 4, [asdrubal-bruna,cathy-dennis,eugene-fernanda]).
round(3, foxtrot, 6, [bruna-dennis,eugene-fernanda]).
round(4, samba, 4, [cathy-asdrubal,bruna-dennis,eugene-fernanda]).
round(5, rhumba, 5, [bruna-asdrubal,eugene-fernanda]).

/* tempo(DanceStyle, Speed).
   tempo/2 indica a velocidade de cada estilo de dança. */
tempo(waltz, slow).
tempo(quickstep, fast).
tempo(foxtrot, slow).
tempo(samba, fast).
tempo(rhumba, slow).

/* Implement style_round_number(?DanceStyle, ?RoundNumber) which relates a dance style to its specific round. */
style_round_number(DanceStyle, RoundNumber) :-
    round(RoundNumber, DanceStyle, _, _).

/* Implement n_dancers(?RoundNumber, -NDancers) which relates each round to its respective number of dancers. */
n_dancers(RoundNumber, NDancers) :-
    round(RoundNumber, _, _, List),
    length(List, Len),
    NDancers is 2 * Len.

/* Implement danced_in_round(?RoundNumber, ?Dancer) which determines who participated in each round. */
danced_in_round(RoundNumber, Dancer) :-
    round(RoundNumber, _, _, List),
    member(P1-_P2, List).
danced_in_round(RoundNumber, Dancer) :-
    round(RoundNumber, _, _, List),
    member(_P1-P2, List).

/* Implement n_rounds(-NRounds) which determines the total number of rounds. */
n_rounds(NRounds) :-
    round(NRounds, _, _, _),
    \+((round(Round,_,_,_), Round > NRounds)).

/* Implement add_dancer_pair(+RoundNumber, +Dancer1, +Dancer2) which modifies the database, adding a dancer pair as participants in a round. 
If either the round doesn't exist or the pair already participates in said round, the predicate should fail. */
add_dancer_pair(RoundNumber, Dancer1, Dancer2) :-
    \+ danced_in_round(RoundNumber, Dancer1),
    \+ danced_in_round(RoundNumber, Dancer2),
    retract(round(RoundNumber, DanceStyle, Minutes, DancerPairs)),
    assertz( round(RoundNumber, DanceStyle, Minutes, [Dancer1-Dancer2 | DancerPairs]) ).

/* Implement total_dance_time(+Dancer, -Time) which determines the total number of minutes danced by a specific dancer. */
total_dance_time(Dancer, Time) :-
	danceTime(Dancer, [], 0, Time).

danceTime(Dancer, Rounds, Temp, Time) :-
	danced_in_round(Round, Dancer),
	\+ member(Round, Rounds), !,
	round(Round, _Style, Mins, _Pairs),
	NTemp is Temp + Mins,
	danceTime(Dancer, [Round|Rounds], NTemp, Time).
danceTime(_Dancer, _Rounds, Time, Time).

/* Implement print_program/0 which should print to the console in the format 'Style (Minutes) - Pairs'; for example:
| ?- print_program.
waltz (8) - 1
quickstep (4) - 3
...
rhumba (5) - 2
yes */
print_program:-
	round(Round, Style, Min, Pairs),
	length(Pairs, NumPairs),
	write(Style), 
	write(' ('), write(Min), 
	write(') - '), write(NumPairs),
	nl,
	fail.
print_program.

/* Implement dancer_n_dances(?Dancer, ?NDances) which relates a dancer to the number of rounds he took part in. */
dancer_n_dances(Dancer, NDances):- 
    setof(Round, danced_in_round(Round, Dancer), DanceList),
    length(DanceList, NDances).

/* Implement most_tireless_dancer(-Dancer) which returns the dancer (or dancers in case of a draw) that danced for the longest time in the competition. */
most_tireless_dancer(Dancer) :- 
    setof(Time-Person, (danced_in_round(Round, Person), total_dance_time(Person, Time)), List),
    reverse(List, [_Time-Dancer | _Rest]).