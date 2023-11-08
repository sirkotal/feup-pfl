:- use_module(library(lists)).

:- dynamic round/4.

% round(RoundNumber, DanceStyle, Minutes, [Dancer1-Dancer2 | DancerPairs])
% round/4 indica, para cada ronda, o estilo de dança, a sua duração, e os pares de dançarinos participantes.
round(1, waltz, 8, [eugene-fernanda]).
round(2, quickstep, 4, [asdrubal-bruna,cathy-dennis,eugene-fernanda]).
round(3, foxtrot, 6, [bruna-dennis,eugene-fernanda]).
round(4, samba, 4, [cathy-asdrubal,bruna-dennis,eugene-fernanda]).
round(5, rhumba, 5, [bruna-asdrubal,eugene-fernanda]).

% tempo(DanceStyle, Speed).
% tempo/2 indica a velocidade de cada estilo de dança.
tempo(waltz, slow).
tempo(quickstep, fast).
tempo(foxtrot, slow).
tempo(samba, fast).
tempo(rhumba, slow).

/* 1. */
style_round_number(DanceStyle, RoundNumber) :- round(RoundNumber, DanceStyle, _Min, _Pairs).

/* 2. */
n_dancers(RoundNumber, NDancers) :- round(RoundNumber, _Style, _Min, Pairs),
                                    length(Pairs, L),
                                    NDancers is L*2.

/* 3. */
danced_in_round(RoundNumber, Dancer):- round(RoundNumber, _Style, _Min, Pairs),
                                       member(Dancer-_Pair, Pairs).
danced_in_round(RoundNumber, Dancer):- round(RoundNumber, _Style, _Min, Pairs),
                                       member(_Pair-Dancer, Pairs).

/* 4. */
n_rounds(NRounds) :- round(Round, _Style, _Min, _Pairs),
                     \+((round(Round1,_,_,_), Round1 > NRounds)).

/* 5. */
add_dancer_pair(RoundNumber, Dancer1, Dancer2) :- \+ danced_in_round(RoundNumber, Dancer1),
                                                  \+ danced_in_round(RoundNumber, Dancer2),
                                                  retract(round(Round, Style, Min, Pairs)),
                                                  assert(round(Round, Style, Min, [Dancer1-Dancer2 | Pairs])).

/* 6. */
total_dance_time(Dancer, Time):- danceTime(Dancer, [], 0, Time).

danceTime(Dancer, Rounds, Temp, Time):- danced_in_round(Round, Dancer),
	                                    \+ member(Round, Rounds),!,
	                                    round(Round, _Style, Min, _Pairs),
	                                    NewTemp is Temp + Min,
	                                    danceTime(Dancer, [Round|Rounds], NewTemp, Time).
                                        danceTime(_Dancer, _Rounds, Time, Time).

/* 7. */
print_program:- round(Round, Style, Min, Pairs),
	            length(Pairs, NumPairs),
	            write(Style), 
	            write(' ('), write(Min), 
	            write(') - '), write(NumPairs),
	            nl,
	            fail.
print_program.

/* 8. */
dancer_n_dances(Dancer, NDances):- setof(Round, danced_in_round(Round, Dancer), DanceList),
                                   length(DanceList, NDances).

/* 9. */
most_tireless_dancer(Dancer) :- setof(Time-Person, (danced_in_round(Round, Person), total_dance_time(Person, Time)), List),
                                reverse(List, [_Time-Dancer | _Rest]).