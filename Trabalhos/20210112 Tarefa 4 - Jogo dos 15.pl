% Tarefa 4 - Jogo dos 15 (2020.01.12)

estadoFinal([[1, 2, 3, 4],
             [5, 6, 7, 8],
	     [9,10,11,12],
	     [13,14,15,v]]). % v é espaço vazio

estado([[A,B,C,D],           % Nessa situação, posso ter qualquer número em qualquer lugar, com exceção no espaço branco
	[E,F,G,H],
	[I,J,K,L],
	[M,N,O,v]]).

no(Estado, Pai, Acao, Custo).

% Movimentos:
% Nessa parte, a ação de movimentar é do tipo movimento(X,Y), onde X é o estado antes desse movimento e Y é o estado depois
	
% andar com o vazio para a direita
direita([[v,A,B,C],[D,E,F,G],[H,I,J,K],[L,M,N,O]], [[A,v,B,C],[D,E,F,G],[H,I,J,K],[L,M,N,O]]).
direita([[A,v,B,C],[D,E,F,G],[H,I,J,K],[L,M,N,O]], [[A,B,v,C],[D,E,F,G],[H,I,J,K],[L,M,N,O]]).
direita([[A,B,v,C],[D,E,F,G],[H,I,J,K],[L,M,N,O]], [[A,B,C,v],[D,E,F,G],[H,I,J,K],[L,M,N,O]]).
direita([[A,B,C,D],[v,E,F,G],[H,I,J,K],[L,M,N,O]], [[A,B,C,D],[E,v,F,G],[H,I,J,K],[L,M,N,O]]).
direita([[A,B,C,D],[E,v,F,G],[H,I,J,K],[L,M,N,O]], [[A,B,C,D],[E,F,v,G],[H,I,J,K],[L,M,N,O]]).
direita([[A,B,C,D],[E,F,v,G],[H,I,J,K],[L,M,N,O]], [[A,B,C,D],[E,F,G,v],[H,I,J,K],[L,M,N,O]]).
direita([[A,B,C,D],[E,F,G,H],[v,I,J,K],[L,M,N,O]], [[A,B,C,D],[E,F,G,H],[I,v,J,K],[L,M,N,O]]).
direita([[A,B,C,D],[E,F,G,H],[I,v,J,K],[L,M,N,O]], [[A,B,C,D],[E,F,G,H],[I,J,v,K],[L,M,N,O]]).
direita([[A,B,C,D],[E,F,G,H],[I,J,v,K],[L,M,N,O]], [[A,B,C,D],[E,F,G,H],[I,J,K,v],[L,M,N,O]]).
direita([[A,B,C,D],[E,F,G,H],[I,J,K,L],[v,M,N,O]], [[A,B,C,D],[E,F,G,H],[I,J,K,L],[M,v,N,O]]).
direita([[A,B,C,D],[E,F,G,H],[I,J,K,L],[M,v,N,O]], [[A,B,C,D],[E,F,G,H],[I,J,K,L],[M,N,v,O]]).
direita([[A,B,C,D],[E,F,G,H],[I,J,K,L],[M,N,v,O]], [[A,B,C,D],[E,F,G,H],[I,J,K,L],[M,N,O,v]]).

% andar com o vazio para a direita
esquerda([[A,v,B,C],[D,E,F,G],[H,I,J,K],[L,M,N,O]], [[v,A,B,C],[D,E,F,G],[H,I,J,K],[L,M,N,O]]).
esquerda([[A,B,v,C],[D,E,F,G],[H,I,J,K],[L,M,N,O]], [[A,v,B,C],[D,E,F,G],[H,I,J,K],[L,M,N,O]]).
esquerda([[A,B,C,v],[D,E,F,G],[H,I,J,K],[L,M,N,O]], [[A,B,v,C],[D,E,F,G],[H,I,J,K],[L,M,N,O]]).
esquerda([[A,B,C,D],[E,v,F,G],[H,I,J,K],[L,M,N,O]], [[A,B,C,D],[v,E,F,G],[H,I,J,K],[L,M,N,O]]).
esquerda([[A,B,C,D],[E,F,v,G],[H,I,J,K],[L,M,N,O]], [[A,B,C,D],[E,v,F,G],[H,I,J,K],[L,M,N,O]]).
esquerda([[A,B,C,D],[E,F,G,v],[H,I,J,K],[L,M,N,O]], [[A,B,C,D],[E,F,v,G],[H,I,J,K],[L,M,N,O]]).
esquerda([[A,B,C,D],[E,F,G,H],[I,v,J,K],[L,M,N,O]], [[A,B,C,D],[E,F,G,H],[v,I,J,K],[L,M,N,O]]).
esquerda([[A,B,C,D],[E,F,G,H],[I,J,v,K],[L,M,N,O]], [[A,B,C,D],[E,F,G,H],[I,v,J,K],[L,M,N,O]]).
esquerda([[A,B,C,D],[E,F,G,H],[I,J,K,v],[L,M,N,O]], [[A,B,C,D],[E,F,G,H],[I,J,v,K],[L,M,N,O]]).
esquerda([[A,B,C,D],[E,F,G,H],[I,J,K,L],[M,v,N,O]], [[A,B,C,D],[E,F,G,H],[I,J,K,L],[v,M,N,O]]).
esquerda([[A,B,C,D],[E,F,G,H],[I,J,K,L],[M,N,v,O]], [[A,B,C,D],[E,F,G,H],[I,J,K,L],[M,v,N,O]]).
esquerda([[A,B,C,D],[E,F,G,H],[I,J,K,L],[M,N,O,v]], [[A,B,C,D],[E,F,G,H],[I,J,K,L],[M,N,v,O]]).

% andar com o vazio para cima
cima([[A,B,C,D],[v,E,F,G],[H,I,J,K],[L,M,N,O]], [[v,B,C,D],[A,E,F,G],[H,I,J,K],[L,M,N,O]]).
cima([[A,B,C,D],[E,v,F,G],[H,I,J,K],[L,M,N,O]], [[A,v,C,D],[E,B,F,G],[H,I,J,K],[L,M,N,O]]).
cima([[A,B,C,D],[E,F,v,G],[H,I,J,K],[L,M,N,O]], [[A,B,v,D],[E,F,C,G],[H,I,J,K],[L,M,N,O]]).
cima([[A,B,C,D],[E,F,G,v],[H,I,J,K],[L,M,N,O]], [[A,B,C,v],[E,F,G,D],[H,I,J,K],[L,M,N,O]]).
cima([[A,B,C,D],[E,F,G,H],[v,I,J,K],[L,M,N,O]], [[A,B,C,D],[v,F,G,H],[E,I,J,K],[L,M,N,O]]).
cima([[A,B,C,D],[E,F,G,H],[I,v,J,K],[L,M,N,O]], [[A,B,C,D],[E,v,G,H],[I,F,J,K],[L,M,N,O]]).
cima([[A,B,C,D],[E,F,G,H],[I,J,v,K],[L,M,N,O]], [[A,B,C,D],[E,F,v,H],[I,J,G,K],[L,M,N,O]]).
cima([[A,B,C,D],[E,F,G,H],[I,J,K,v],[L,M,N,O]], [[A,B,C,D],[E,F,G,v],[I,J,K,H],[L,M,N,O]]).
cima([[A,B,C,D],[E,F,G,H],[I,J,K,L],[v,M,N,O]], [[A,B,C,D],[E,F,G,H],[v,J,K,L],[I,M,N,O]]).
cima([[A,B,C,D],[E,F,G,H],[I,J,K,L],[M,v,N,O]], [[A,B,C,D],[E,F,G,H],[I,v,K,L],[M,J,N,O]]).
cima([[A,B,C,D],[E,F,G,H],[I,J,K,L],[M,N,v,O]], [[A,B,C,D],[E,F,G,H],[I,J,v,L],[M,N,K,O]]).
cima([[A,B,C,D],[E,F,G,H],[I,J,K,L],[M,N,O,v]], [[A,B,C,D],[E,F,G,H],[I,J,K,v],[M,N,O,L]]).

% andar com o vazio para baixo
baixo([[v,A,B,C],[D,E,F,G],[H,I,J,K],[L,M,N,O]], [[D,A,B,C],[v,E,F,G],[H,I,J,K],[L,M,N,O]]).
baixo([[A,v,B,C],[D,E,F,G],[H,I,J,K],[L,M,N,O]], [[A,E,B,C],[D,v,F,G],[H,I,J,K],[L,M,N,O]]).
baixo([[A,B,v,C],[D,E,F,G],[H,I,J,K],[L,M,N,O]], [[A,B,F,C],[D,E,v,G],[H,I,J,K],[L,M,N,O]]).
baixo([[A,B,C,v],[D,E,F,G],[H,I,J,K],[L,M,N,O]], [[A,B,C,G],[D,E,F,v],[H,I,J,K],[L,M,N,O]]).
baixo([[A,B,C,D],[v,E,F,G],[H,I,J,K],[L,M,N,O]], [[A,B,C,D],[H,E,F,G],[v,I,J,K],[L,M,N,O]]).
baixo([[A,B,C,D],[E,v,F,G],[H,I,J,K],[L,M,N,O]], [[A,B,C,D],[E,I,F,G],[H,v,J,K],[L,M,N,O]]).
baixo([[A,B,C,D],[E,F,v,G],[H,I,J,K],[L,M,N,O]], [[A,B,C,D],[E,F,J,G],[H,I,v,K],[L,M,N,O]]).
baixo([[A,B,C,D],[E,F,G,v],[H,I,J,K],[L,M,N,O]], [[A,B,C,D],[E,F,G,K],[H,I,J,v],[L,M,N,O]]).
baixo([[A,B,C,D],[E,F,G,H],[v,I,J,K],[L,M,N,O]], [[A,B,C,D],[E,F,G,H],[L,I,J,K],[v,M,N,O]]).
baixo([[A,B,C,D],[E,F,G,H],[I,v,J,K],[L,M,N,O]], [[A,B,C,D],[E,F,G,H],[I,M,J,K],[L,v,N,O]]).
baixo([[A,B,C,D],[E,F,G,H],[I,J,v,K],[L,M,N,O]], [[A,B,C,D],[E,F,G,H],[I,J,N,K],[L,M,v,O]]).
baixo([[A,B,C,D],[E,F,G,H],[I,J,K,v],[L,M,N,O]], [[A,B,C,D],[E,F,G,H],[I,J,K,O],[L,M,N,v]]).


% Regra para a movimentação que se deseja fazer
% Movimentação tem custo 1
acao(Antes, direita, Depois, 1)	:- direita(Antes, Depois).
acao(Antes, esquerda, Depois, 1) :- esquerda(Antes, Depois).
acao(Antes, cima, Depois, 1) :- cima(Antes, Depois).
acao(Antes, baixo, Depois, 1) :- baixo(Antes, Depois).


% Heurísticas
fn(NoAtual, Fn, heuristica1) :-
    	NoAtual = no(EstadoAtual,_,_,Gn),
	heuristica1(EstadoAtual, Hn),
	Fn is Gn + Hn.

fn(NoAtual, Fn, heuristica2) :-
    	NoAtual = no(EstadoAtual,_,_,Gn),
	heuristica2(EstadoAtual, Hn),
	Fn is Gn + Hn.

% 1 - Número de peças fora do lugar
heuristica1(Atual, Hn) :-
	estadoFinal(Final),
	flatten(Atual, AtualFlatten),             	% usa o flatten para a lista ficar sem colchetes e facilitar a contagem de 
	flatten(Final, FinalFlatten),			% quantos nós fora do lugar há
	foraLugar(AtualFlatten, FinalFlatten, Hn).

foraLugar([], [], 0).
foraLugar([H|T1], [H|T2], Dist) :- foraLugar(T1, T2, Dist). 
foraLugar([H1|T1], [H2|T2], Dist) :-
	H1 \== H2,
	foraLugar(T1, T2, D),
	Dist is D + 1.