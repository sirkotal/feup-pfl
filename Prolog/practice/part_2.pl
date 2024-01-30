/* Robin wanted to implement a predicate most_successful_composer(+Composer1, +Composer2, ?MostSuccessful), which unifies the third argument with the most successful of the two composers received in the first two arguments (the one with the highest average score). In the case of ties, the third argument can be unified with any of the first two. */
most_successful_composer(Composer1, Composer2, Composer1):-
	composer_rating(Composer1, R1),
	composer_rating(Composer2, R2),
	R1 >= R2.
most_successful_composer(Composer1, Composer2, Composer2):-
	composer_rating(Composer1, R1),
	composer_rating(Composer2, R2),
	R2 >= R1.

/* We want to write facts in the form: Composer composed_for Movie */
Composer composed_for Movie:- 
	movie(Movie, _Year, _Saga, _Dur, _Score, _Dir, Composer, _Cast).