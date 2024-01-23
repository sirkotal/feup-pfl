:-dynamic saga/4, movie/8.

:-use_module(library(lists)).

/* saga(SagaID, Saga Name, Number of Movies in Saga, Creator) */
saga(1, 'Jurassic Park',  6, 'Michael Crichton').
saga(2, 'Indiana Jones',  4, 'George Lucas').
saga(3, 'Star Wars',      9, 'George Lucas').
saga(4, 'Harry Potter',   0, 'J. K. Rowling').
saga(6, 'Jaws',           0, 'Peter Benchley').

/* movie(Movie Title, Year of Release, SagaID, Duration, IMDB Score, Director, Composer, Cast) */
movie('Jurassic Park',                  1993, 1, 127, 8.2, 'Steven Spielberg', 'John Williams',     ['Sam Neill', 'Jeff Goldblum', 'Laura Dern', 'BD Wong']).
movie('The Lost World: Jurassic Park',  1997, 1, 129, 6.5, 'Steven Spielberg', 'John Williams',     ['Jeff Goldblum', 'Julianne Moore', 'Vince Vaughn', 'Richard Schiff']).
movie('Jurassic Park III',              2001, 1,  92, 5.9, 'Joe Johnston',     'Don Davis',         ['Sam Neill', 'William H. Macy', 'Téa Leoni']).
movie('Jurassic World',                 2015, 1, 124, 6.9, 'Colin Trevorrow',  'Michael Giacchino', ['Chris Pratt', 'Bryce Dallas Howard', 'Irrfan Khan', 'BD Wong']).
movie('Jurassic World: Fallen Kingdom', 2018, 1, 128, 6.1, 'J.A. Bayona',      'Michael Giacchino', ['Chris Pratt', 'Bryce Dallas Howard', 'James Cromwell', 'BD Wong']).
movie('Jurassic World: Dominion',       2022, 1, 147, 5.6, 'Colin Trevorrow',  'Michael Giacchino', ['Chris Pratt', 'Bryce Dallas Howard', 'Campbell Scott', 'BD Wong']).

movie('Raiders of the Lost Ark',       1981, 2, 115, 8.4, 'Steven Spielberg', 'John Williams', ['Harrison Ford', 'Karen Allen', 'John Rhys-Davies']).
movie('The Temple of Doom',            1984, 2, 118, 7.5, 'Steven Spielberg', 'John Williams', ['Harrison Ford', 'Kate Capshaw', 'Ke Huy Quan']).
movie('The Last Crusade',              1989, 2, 127, 8.2, 'Steven Spielberg', 'John Williams', ['Harrison Ford', 'Alison Doody', 'Sean Connery']).
movie('Kingdom of the Crystal Skull',  2008, 2, 122, 6.2, 'Steven Spielberg', 'John Williams', ['Harrison Ford', 'Karen Allen', 'Shia LaBeouf']).

movie('The Phantom Menace',       1999, 3, 136, 6.5, 'George Lucas',     'John Williams', ['Ewan McGregor', 'Liam Neeson', 'Natalie Portman', 'Ian McDiarmid']).
movie('Attack of the Clones',     2002, 3, 142, 6.6, 'George Lucas',     'John Williams', ['Ewan McGregor', 'Hayden Christensen', 'Natalie Portman', 'Christopher Lee']).
movie('Revenge of the Sith',      2005, 3, 140, 7.6, 'George Lucas',     'John Williams', ['Ewan McGregor', 'Hayden Christensen', 'Natalie Portman', 'Christopher Lee']).
movie('A New Hope',               1977, 3, 121, 8.6, 'George Lucas',     'John Williams', ['Harrison Ford', 'Mark Hamill', 'Carrie Fisher', 'Alec Guinness']).
movie('The Empire Strikes Back',  1980, 3, 124, 8.7, 'Irvin Kershner',   'John Williams', ['Harrison Ford', 'Mark Hamill', 'Carrie Fisher', 'Billy Dee Williams']).
movie('Return of the Jedi',       1983, 3, 131, 8.3, 'Richard Marquand', 'John Williams', ['Harrison Ford', 'Mark Hamill', 'Carrie Fisher', 'Ian McDiarmid']).
movie('The Force Awakens',        2015, 3, 138, 7.8, 'J. J. Abrams',     'John Williams', ['Daisy Ridley', 'Harrison Ford', 'Mark Hamill', 'Carrie Fisher']).
movie('The Last Jedi',            2017, 3, 152, 6.9, 'Rian Johnson',     'John Williams', ['Daisy Ridley', 'Mark Hamill', 'Carrie Fisher', 'John Boyega']).
movie('The Rise of Skywalker',    2019, 3, 141, 6.4, 'J. J. Abrams',     'John Williams', ['Daisy Ridley', 'Mark Hamill', 'John Boyega', 'Adam Driver']).


/* Implement same_year(?Movie1, ?Movie2), which succeeds if the two (distinct) movies came out in the same year, failing otherwise. */
same_year(One, Two) :- 
    movie(One, Y, _, _, _, _, _, _), 
    movie(Two, Y, _, _, _, _, _, _),
    One \== Two.

/* Implement movie_from_saga(?Movie, ?Saga), which relates a movie title with the name of the saga it belongs to. */
movie_from_saga(M, S) :- 
    movie(M, _, I, _, _, _, _, _),
    saga(I, S, _, _).

/* Implement saga_longest_movie(?Saga, ?Movie), which relates a saga name with the movie title of the longest movie in the saga. */
saga_longest_movie(S, M) :-
    movie(M, _, I, D1, _, _, _, _),
    saga(I, S, _, _),
    (movie(_, _, I, D2, _, _, _, _), D2 =< D1). 


/* Implement add_movie_to_saga(+Saga, +Movie, +Year, +Duration, +Score, +Director, +Composer, +Cast), which updates a given saga, adding a new movie to it with the provided information. If the specified movie already exists, the predicate should fail. */
add_movie_to_saga(Saga, Movie, Year, Duration, Score, Director, Composer, Cast) :-
    saga(SagaID, Saga, _N, _C),
	movie(Movie, Year, SagaID, Duration, Score, Director, Composer, Cast), !, fail.
add_movie_to_saga(Saga, Movie, Year, Duration, Score, Director, Composer, Cast):-
	retract(saga(SagaID, Saga, OldN, Creator)),
	NewN is OldN + 1,
	assertz(saga(SagaID, Saga, NewN, Creator)),
	assertz(movie(Movie, Year, SagaID, Duration, Score, Director, Composer, Cast)).

/* Implement movies_from_saga(+Saga, -Movies), which returns in Movies a list of all movie titles from Saga, ordered by year of release. */
remove_year([], []).
remove_year([_Y-Movie | T], [Movie | T2]):-
	remove_year(T, T2).

movies_from_saga(Saga, Movies):-
	saga(SagaID, Saga, _N, _C),
	movies_from_saga(SagaID, [], Movies).
movies_from_saga(SagaID, Movies, Final):-
	movie(Movie, Year, SagaID, _Dur, _Score, _Dir, _Comp, _Cast),
	\+ member(Year-Movie, Movies), !,
	movies_from_saga(SagaID, [Year-Movie|Movies], Final).
movies_from_saga(_SagaID, AllMovies, Movies):-
	sort(AllMovies, SortedMovies),
	remove_year(SortedMovies, Movies).

/* Implement saga_cast(+Saga, -Cast), which returns in Cast a list of all actors (in any order) who participated in movies from Saga. Avoid duplicate actors in the resulting list. */
saga_cast(S, C) :-
	findall(Actor, (saga(N, S, _, _), movie(_, _, N, _, _, _, _, Cast), member(Actor, Cast)), RepC),
	remove_dups(RepC, C).

/* Implement sample_cast(+Saga, -Cast), which returns a sample of the cast from Saga, by selecting only the actors in odd positions in the list of actors who participated in Saga (as given by the previous question). */
sample_cast(S, C) :-
	saga_cast(S, Tmp),
	findall(Actor, (nth1(I,Tmp,Actor), I mod 2 =:= 1), C).

/* Implement composer_rating(+Composer, ?AvgScore), which unifies AvgScore with the average score of the movies for which Composer wrote the music. */
composer_rating(Composer, AvgScore) :-
    findall(Score, (movie(_Title, _Year, _Saga, _Duration, Score, _Director, Composer, _Cast)), Scores),
    length(Scores, N),
    sumlist(Scores, Sum),
    AvgScore is Sum / N.

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