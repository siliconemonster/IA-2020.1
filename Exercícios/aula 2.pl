/* Testando o exemplo do final do slide da aula 2 */

parent(kim,park).
parent(park,min).
parent(min,jeon).
parent(jeon,jung).

ancestral(X,Z) :- parent(X,Z).
ancestral(X,Z) :- parent(X,Y1), ancestral(Y1,Z). % primeiro os pais, depois todas as relações de kim, depois etc

ancestral2(X,Z) :- parent(X,Y1), ancestral2(Y1,Z). % primeiro todas as relações de kim exceto filho, depois etc, depois todos os pais
ancestral2(X,Z) :- parent(X,Z).

ancestral3(X,Z) :- parent(X,Z).					   % ficou pensando muito no final e deu stack limit
ancestral3(X,Z) :- ancestral3(Y1,Z), parent(X,Y1). % primeiro os pais, depois os avós, depois bisavós, etc

ancestral4(X,Z) :- ancestral4(Y1,Z), parent(X,Y1).
ancestral4(X,Z) :- parent(X,Z). %stack limit logo no começo 

/* ------------------------------------------------------------------------------------------------------------------------------------

Exercícios:

 * Faça um programa recursivo que dado 
 * um número n, retorna a soma dos números
 * de 0 a n. Por exemplo:
 * ?-soma(5,S).
 * S = 15
 * 
 * Fazer soma de números negativos para praticar
 */

soma(0,0).
soma(N,S) :- 
    N > 0,
    N1 is N - 1,
    soma(N1,S1),
	S is N + S1.

somaneg(0,0).
somaneg(N,S) :-
    N < 0,
    N1 is N + 1,
    somaneg(N1,S1),
    S is N + S1.

/* 
 * Faça um programa recursivo que dado um número 
 * n, retorna o fatorial de n. Por exemplo:
 * ?- fatorial(5,S).
 * S = 120
 */

fatorial(0,1).
fatorial(1,1).
fatorial(N,F) :-
    N > 1,
    N1 is N - 1,
    fatorial(N1, F1),
    F is N * F1.