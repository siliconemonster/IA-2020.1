/*
 * Faça um programa Prolog que recebe um número X e
 * uma lista ordenada de forma crescente L1, e retorna
 * a lista ordenada L2 que é obtida acrescentando X a
 * L1. Você não pode usar nenhum predicado pré-definido
 * do swipl.
 */
   
ordena(X, [], [X]).
ordena([], L1, L1).

% sem o cut, botava o número x em todas as posições a partir de x+1, o que faz sentido porque a minha única restrição é que seja maior do que x-1
% não consegui pensar em uma maneira de utilizar o H anterior para comparar o tamanho, ao entrar na recursão  
ordena(X, [H|T], [X, H|T]) :- X =< H, !.
ordena(X, [H|T], [H|L2]) :- ordena(X, T, L2).

/*
 * Faça um programa Prolog que dado um número qualquer
 * X maior ou igual a zero, retorna em uma lista L, todos
 * os múltiplos de 4 que são menores ou iguais a  X.
 */ 

mult4(X, []) :- X >= 0, X < 4.
mult4(X, L) :- X > 0, criaLista(X, 4, L).

% criei essa nova função pois não soube determinar o valor inicial do contador no corpo de "mult4()"
criaLista(X, Cont, []) :- Cont > X.
criaLista(X, Cont, [Cont|L1]) :-
    Cont =< X,
    Cont1 is Cont + 4,
    criaLista(X, Cont1, L1).