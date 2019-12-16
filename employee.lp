%  0.Employee scheduling problem involves planning the schedule of five managers Bill,
%  Mary, John, Gary, Linda for a week [1]. Problem description:
%  1. There are three shifts, morning, midday and evening.
%  2. Each manager is supposed to work for 40 hours in a week.
%  3. At least one manager must be present at any point of time.
%  4. Each manager should get two days off.
%  5. Each manager works no more than 8.5 hours a day.
%  6. The manager who works in the evening shift cannot be scheduled for the
%     following day's morning shift.
%  7. The schedule should be fair to all managers.

%Sentance 0
person(bill). person(mary). person(gary). person(linda). person(john).
day(monday). day(tuesday). day(wednesday). day(thursday). day(friday). day(saturday). day(sunday).

%Sentance 1
shift(morning). shift(midday). shift(evening).

%Sentance 4
 {workday(X,Y): day(Y)} 5:- person(X).

workdayshifthelper(D,S):-workday(X,D),person(X),shift(S).

%Sentance 2/5
{workdayshift(D,S,X):workdayshifthelper(D,S)}==5 :- person(X).

%Sentance 3
workdayday(Y):- day(Y),workday(X,Y).
:- day(Y), not workdayday(Y).
{workdayshift(D,S,X) : person(X)} > 0 :- workdayshifthelper(D,S).

:- workdayshift(D,S,X), workdayshift(D,S2,X), not S=S2.


%Sentance 6
followingday(monday,tuesday).
followingday(tuesday,wednesday).
followingday(wednesday,thursday).
followingday(thursday,friday).
followingday(friday,saturday).
followingday(saturday,sunday).
followingday(sunday,monday).
:- workdayshift(D,evening,X), workdayshift(D2,morning,X),followingday(D,D2).


%Sentance 7
{workdayshift(D,evening,X):day(D)}2 :- person(X).
{workdayshift(D,morning,X):day(D)}2 :- person(X).
2{workdayshift(D,midday,X):day(D)} :- person(X).


#show workdayshift/3.
