/* Faça um programa Prolog que dadas duas listas L1 e L2,
 * retorne a lista L3 que é a união de L1 e L2. Note que
 * nesta união não pode haver elementos repetidos.
 */ 

% Regra geral
uniao(L1,L2,L3) :- 
    descobreIguais(L1,L2,L4), % descobre e remove ambos de cada
    adicionaRemovidos(L1,L4,L3). % adiciona apenas um de cada


%%%%%%%%%%%%%%%% DESCOBRE IGUAIS %%%%%%%%%%%%%%%%%%%%%%
% Caso base
descobreIguais(X, [X|T], T) :- % se estiver na cabeça de L2, já remove direto MAS PRECISO FAZER RODAR DE NOVO CASO HAJA MAIS DE UM  ALGARISMO REPETIDO
    remove(H, [Y|T2], Result),
	descobreIguais(T1, Result, _),

% Regra geral para descobrir os algarismos iguais (NÃO FUNCIONA AINDA) 
descobreIguais([H|T1], [Y|T2], [Y|_]) :- 
    member(H,[Y|T2]), !, 
    remove(H, [Y|T2], Result),
	descobreIguais(T1, Result, _), !. % consigo pegar o resultado certo, mas não sei usá-lo


%%%%%%%%%%%%%%%%%%%%% REMOVE %%%%%%%%%%%%%%%%%%%%%%%%%%
% Caso base
remove(X, [X|T], T). 

% Regra geral da remoção
remove(X, [Y|T], [Y|T1]) :- remove(X, T, T1).


%%%%%%%%%%%%%%% ADICIONA REMOVIDOS %%%%%%%%%%%%%%%%%%%%
% Caso base
adicionaRemovidos([], L, L).

% Regra geral da concatenação
adicionaRemovidos([H1|T1], L2, [H1|T3]) :- adicionaRemovidos(T1, L2, T3).


/* Faça um programa Prolog que dadas duas listas L1 e L2,
 * retorne a lista L3 que contém todos os elementos de L1
 * que não estão em L2.
 */

% Caso base
lista([], _, []).

% Se o elemento não estiver na cabeça de L1
lista([H|T], Elemento, [H|L]) :-
    not(member(H, Elemento)), !,
    lista(T, Elemento, L).

% Se o elemento estiver na cabeça de L1
lista([_|T], Elemento, L) :- lista(T, Elemento, L).