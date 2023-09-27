job(technician, eleuterio).
job(technician, juvenaldo).
job(analyst, leonilde).
job(analyst, marciliano).
job(engineer, osvaldo).
job(engineer, porfirio).
job(engineer, reginaldo).
job(supervisor, sisnando).
job(chief_supervisor, gertrudes).
job(secretary, felismina).
job(director, asdrubal).

supervised_by(technician, engineer).
supervised_by(engineer, supervisor).
supervised_by(analyst, supervisor).
supervised_by(supervisor, chief_supervisor).
supervised_by(chief_supervisor, director).
supervised_by(secretary, director).

/* a) 

i -> Does Sisnando supervise the analysts?

ii -> Which post supervises the post that supervises technicians?

iii -> Who is supervised by a supervisor?

iv ->  Who is supervised by Asdrubal? /*

/* b) 

i -> true

ii -> Y = supervisor

iii -> J = analyst,
       P = leonilde

       J = analyst,
       P = marciliano

       J = engineer,
       P = osvaldo

       J = engineer,
       P = porfirio

       J = engineer,
       P = reginaldo

iv ->  P = gertrudes
       P = felismina /*

/* c) */

boss(X, Y) :- job(J1, X), job(J2, Y), supervised_by(J2, J1).
same_boss(X, Y) :- job(J1, X), job(J2, Y), supervised_by(J1, B), supervised_by(J2, B).