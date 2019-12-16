person(roberta). person(thelma). person(steve). person(pete).

female(roberta). female(thelma).

male(steve). male(pete).

:- person(X), male(X), female(X).

1 {hold(X,Y) : person(X)} 1 :- job(Y).

2 {hold(X,Y) : job(Y)} 2 :- person(X).

job(chef). job(guard). job(nurse). job(operator). job(actor). job(police). job(boxer). job(teacher).

male(X) :- person(X), job(nurse), hold(X,nurse).

male(X) :- person(X), job(actor), hold(X,actor).

husband(Y,X) :- person(X), job(chef), hold(X,chef), person(Y),
job(operator), hold(Y,operator).

male(X) :- person(X), person(Y), husband(X,Y).

female(Y) :- person(X), person(Y), husband(X,Y).

:- job(boxer), hold(roberta,boxer).

:- educated(pete).

educated(X) :- person(X), job(nurse), hold(X,nurse).

educated(X) :- person(X), job(police), hold(X,police).

educated(X) :- person(X), job(teacher), hold(X,teacher).

:- job(chef), hold(roberta,chef).

:- job(police), hold(roberta,police).

:- person(X), job(chef), hold(X,chef), job(police),
hold(X,police).

%answer(hold(X,Y)) :- job(Y), hold(X,Y).

#show hold/2.
