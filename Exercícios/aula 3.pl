conc([], L, L).
conc([X|L1], L2, [X|L3]) :- conc(L1, L2, L3).

/* 3.1 a)
 * ?- conc(L,[7,8,9],[1,2,3,4,5,6,7,8,9]).
 */

/* 3.1 b)
 * ?- conc([1,2,3],L,[1,2,3,4,5,6,7,8,9]).
 */


% NÃO CONSIGO DESCOBRIR COMO PEGO O TAMANHO DA LISTA!!!

% 3.2 a)
 last([],[]).
last(Item, List) :- len(Item) > 3, conc(List1, Item, List).
  
% 3.2 b)
del([],[],[]).
del(X, Tail, [[X]|Tail]).



/*

len(List, Y).

last([],[]).
last(Item, List) :- procura(Item, List, 0).

procura(X,[X], Cont).
procura(Item, List, Cont) :-
    Cont =< Y,
    Cont1 is Cont + 1,
    procura(Item, List, Cont1).
