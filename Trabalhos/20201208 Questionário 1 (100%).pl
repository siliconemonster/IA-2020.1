parent(pam,bob).
parent(tom,bob).
parent(pam,jen). % acrescentei
parent(tom,jen). % acrescentei
parent(tom,liz).
parent(bob,ann).
parent(bob,pat).
parent(pat,jim).
female(pam).
female(liz).
female(ann).
female(pat).
female(jen). % acrescentei
male(tom).
male(bob).
male(jim).
father(X,Y) :- male(X), parent(X,Y).
mother(X,Y) :- female(X), parent(X,Y).
irmaos(X,Y) :- father(Z,X), father(Z,Y), mother(W,X), mother(W,Y), X\=Y.