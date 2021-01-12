/*
 * Tarefa 4.1 - Jogo dos 15 - Teste do Tabuleiro Inicial (2021.01.14)
 * Nesta tarefa constará apenas a parte do código relativa a esse teste.
 * Referência tirada de: https://www.geeksforgeeks.org/check-instance-15-puzzle-solvable/
 *
 * A consulta deve ser do tipo isSolvable(estadoInicial2(X)).
 */

%%%%%%%%%%%%%%%%%%%%%%%%%% MODELAGEM %%%%%%%%%%%%%%%%%%%%%%%%%%

estadoFinal([[1,   2,  3,  4],
             [5,   6,  7,  8],
	     [9,  10, 11, 12],
	     [13, 14, 15, 99]]). % 99 é espaço vazio

estadoInicial1([[ 3,  9,  1, 15],
		[14, 11,  4,  6],
		[13, 99, 10, 12],
		[ 2,  7,  8,  5]]). % not solvable

estadoInicial2([[ 6, 13,  7, 10],
		[ 8,  9, 11, 99],
		[15,  2, 12,  5],
		[14,  3,  1,  4]]). % solvable


%%%%%%%%%%%%%%%%%%%%%%%%%% ALGORITMOS %%%%%%%%%%%%%%%%%%%%%%%%%%


% Checa se existe caminho do estado inicial ao estado final
isSolvable(Tabuleiro) :-
	linhaVazio(Tabuleiro, Indice),
	0 =:= Indice mod 2,
	flatten(Tabuleiro, TabuleiroFlatten),
	contaInversoes(TabuleiroFlatten, Num), !,
	1 =:= Num mod 2.
isSolvable(Tabuleiro) :-
	linhaVazio(Tabuleiro, Indice),
	1 =:= Indice mod 2,
	flatten(Tabuleiro, TabuleiroFlatten),
	contaInversoes(TabuleiroFlatten, Num), !,
	0 =:= Num mod 2.


% Regra para saber em que linha se encontra o espaço vazio
linhaVazio([H|T], 0) :-
    member(99, H), !.
linhaVazio([H|T], IndiceLinha) :-
    linhaVazio(T, IndiceLinha1),
    IndiceLinha is IndiceLinha1 + 1.


% Regras para contar quantas inversões há, de acordo com o link de referência
% A lista de entrada de contaInversoes precisa ser flatten!!
contaInversoes([], 0).
contaInversoes([H|T], NumInversoes) :-
    contaInversoesElemento(H, T, Num),
    contaInversoes(T, NumInversoes1),
    NumInversoes is NumInversoes1 + Num.
    
contaInversoesElemento(Elem, [], 0).
contaInversoesElemento(99, _, 0). % espaço vazio
contaInversoesElemento(Elem, [H|T], Num) :-
    Elem < H,
    contaInversoesElemento(Elem, T, Num).
contaInversoesElemento(Elem, [H|T], Num) :- 
    Elem > H,
    contaInversoesElemento(Elem, T, Num1),
    Num is Num1 + 1.