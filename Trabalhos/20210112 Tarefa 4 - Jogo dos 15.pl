% Tarefa 4 - Jogo dos 15 (2021.01.12) - !!!incompleto!!!

%%%%%%%%%%%%%%%%%%%%%%%%%% MODELAGEM %%%%%%%%%%%%%%%%%%%%%%%%%%


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


%%%%%%%%%%%%%%%%%%%%%%%%%% HEURÍSTICAS %%%%%%%%%%%%%%%%%%%%%%%%%%


% Resultado da função f(n) utilizando uma das heurísticas
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

% 2 - Distância Manhattan
heuristica2(Atual, Hn) :-
	Atual = [[_1x1,_1x2,_1x3,_1x4],[_2x1,_2x2,_2x3,_2x4],[_3x1,_3x2,_3x3,_3x4],[_4x1,_4x2,_4x3,_4x4]], % Matriz com variáveis que simbolizam sua posição
     	pos1x1(_1x1,Da), pos1x2(_1x2,Db), pos1x3(_1x3,Dc), pos1x4(_1x4,Dd),
     	pos2x1(_2x1,De), pos2x2(_2x2,Df), pos2x3(_2x3,Dg), pos2x4(_2x4,Dh),
     	pos3x1(_3x1,Di), pos3x2(_3x2,Dj), pos3x3(_3x3,Dk), pos3x4(_3x4,Dl),
     	pos4x1(_4x1,Dm), pos4x2(_4x2,Dn), pos4x3(_4x3,Do), pos4x4(_4x4,Dp),
     	Hn is Pa + Pb + Pc + Pd + Pe + Pf + Pg + Ph + Pi + Pj + Pk + Pl + Pm + Pn + Po + Pp.

% posIxJ(m,n) me diz que na posição IxJ, a célula m está a n de distância do seu devido lugar
% Como diz a distância Manhattan, n é calculado como |x1 - x2| + |y1 + y2|
pos1x1(1,0). pos1x1(2,1). pos1x1(3,2). pos1x1(4,3). pos1x1(5,1). pos1x1(6,2). pos1x1(7,3). pos1x1(8,4). pos1x1(9,2). pos1x1(10,3). pos1x1(11,4). pos1x1(12,5). pos1x1(13,3). pos1x1(14,4). pos1x1(15,5). pos1x1(v,6).
pos1x2(1,1). pos1x2(2,0). pos1x2(3,1). pos1x2(4,2). pos1x2(5,2). pos1x2(6,1). pos1x2(7,2). pos1x2(8,3). pos1x2(9,3). pos1x2(10,2). pos1x2(11,3). pos1x2(12,4). pos1x2(13,4). pos1x2(14,3). pos1x2(15,4). pos1x2(v,5).
pos1x3(1,2). pos1x3(2,1). pos1x3(3,0). pos1x3(4,1). pos1x3(5,3). pos1x3(6,2). pos1x3(7,1). pos1x3(8,2). pos1x3(9,4). pos1x3(10,3). pos1x3(11,2). pos1x3(12,3). pos1x3(13,5). pos1x3(14,4). pos1x3(15,3). pos1x3(v,4).
pos1x4(1,3). pos1x4(2,2). pos1x4(3,1). pos1x4(4,0). pos1x4(5,4). pos1x4(6,3). pos1x4(7,2). pos1x4(8,1). pos1x4(9,5). pos1x4(10,4). pos1x4(11,3). pos1x4(12,2). pos1x4(13,6). pos1x4(14,5). pos1x4(15,4). pos1x4(v,3).
pos2x1(1,1). pos2x1(2,2). pos2x1(3,3). pos2x1(4,4). pos2x1(5,0). pos2x1(6,1). pos2x1(7,2). pos2x1(8,3). pos2x1(9,1). pos2x1(10,2). pos2x1(11,3). pos2x1(12,4). pos2x1(13,2). pos2x1(14,3). pos2x1(15,4). pos2x1(v,5).
pos2x2(1,2). pos2x2(2,1). pos2x2(3,2). pos2x2(4,3). pos2x2(5,1). pos2x2(6,0). pos2x2(7,1). pos2x2(8,2). pos2x2(9,2). pos2x2(10,1). pos2x2(11,2). pos2x2(12,3). pos2x2(13,3). pos2x2(14,2). pos2x2(15,3). pos2x2(v,4).
pos2x3(1,3). pos2x3(2,2). pos2x3(3,1). pos2x3(4,2). pos2x3(5,2). pos2x3(6,1). pos2x3(7,0). pos2x3(8,1). pos2x3(9,3). pos2x3(10,2). pos2x3(11,1). pos2x3(12,2). pos2x3(13,4). pos2x3(14,3). pos2x3(15,2). pos2x3(v,3).
pos2x4(1,4). pos2x4(2,3). pos2x4(3,2). pos2x4(4,1). pos2x4(5,3). pos2x4(6,2). pos2x4(7,1). pos2x4(8,0). pos2x4(9,4). pos2x4(10,3). pos2x4(11,2). pos2x4(12,1). pos2x4(13,5). pos2x4(14,4). pos2x4(15,3). pos2x4(v,2).
pos3x1(1,2). pos3x1(2,3). pos3x1(3,4). pos3x1(4,5). pos3x1(5,1). pos3x1(6,2). pos3x1(7,3). pos3x1(8,4). pos3x1(9,0). pos3x1(10,1). pos3x1(11,2). pos3x1(12,3). pos3x1(13,1). pos3x1(14,2). pos3x1(15,3). pos3x1(v,4).
pos3x2(1,3). pos3x2(2,2). pos3x2(3,3). pos3x2(4,4). pos3x2(5,2). pos3x2(6,1). pos3x2(7,2). pos3x2(8,3). pos3x2(9,1). pos3x2(10,0). pos3x2(11,1). pos3x2(12,2). pos3x2(13,2). pos3x2(14,1). pos3x2(15,2). pos3x2(v,3).
pos3x3(1,4). pos3x3(2,3). pos3x3(3,2). pos3x3(4,3). pos3x3(5,3). pos3x3(6,2). pos3x3(7,1). pos3x3(8,2). pos3x3(9,2). pos3x3(10,1). pos3x3(11,0). pos3x3(12,1). pos3x3(13,3). pos3x3(14,2). pos3x3(15,1). pos3x3(v,2).
pos3x4(1,5). pos3x4(2,4). pos3x4(3,3). pos3x4(4,2). pos3x4(5,4). pos3x4(6,3). pos3x4(7,2). pos3x4(8,1). pos3x4(9,3). pos3x4(10,2). pos3x4(11,1). pos3x4(12,0). pos3x4(13,4). pos3x4(14,3). pos3x4(15,2). pos3x4(v,1).
pos4x1(1,3). pos4x1(2,4). pos4x1(3,5). pos4x1(4,6). pos4x1(5,2). pos4x1(6,3). pos4x1(7,4). pos4x1(8,5). pos4x1(9,1). pos4x1(10,2). pos4x1(11,3). pos4x1(12,4). pos4x1(13,0). pos4x1(14,1). pos4x1(15,2). pos4x1(v,3).
pos4x2(1,4). pos4x2(2,3). pos4x2(3,4). pos4x2(4,5). pos4x2(5,3). pos4x2(6,2). pos4x2(7,3). pos4x2(8,4). pos4x2(9,2). pos4x2(10,1). pos4x2(11,2). pos4x2(12,3). pos4x2(13,1). pos4x2(14,0). pos4x2(15,1). pos4x2(v,2).
pos4x3(1,5). pos4x3(2,4). pos4x3(3,3). pos4x3(4,4). pos4x3(5,4). pos4x3(6,3). pos4x3(7,2). pos4x3(8,3). pos4x3(9,3). pos4x3(10,2). pos4x3(11,1). pos4x3(12,2). pos4x3(13,2). pos4x3(14,1). pos4x3(15,0). pos4x3(v,1).
pos4x4(1,6). pos4x4(2,5). pos4x4(3,4). pos4x4(4,3). pos4x4(5,5). pos4x4(6,4). pos4x4(7,3). pos4x4(8,2). pos4x4(9,4). pos4x4(10,3). pos4x4(11,2). pos4x4(12,1). pos4x4(13,3). pos4x4(14,2). pos4x4(15,1). pos4x4(v,0).


%%%%%%%%%%%%%%%%%%%%%%%%%% ALGORITMOS %%%%%%%%%%%%%%%%%%%%%%%%%%


objetivo(No, Alvo) :- 0 is No mod Alvo.


%encontrei essa regra na internet
h(No, Hvalor, Alvo) :-     % Não sei bem como adaptar isso para as minhas heurísticas
    objetivo(No, Alvo), !,
    Hvalor is 0; Hvalor is 1/No.


%encontrei essa regra na internet
menos([No1, Custo1], [No2, Custo2], Alvo) :-
	h(No1, Hvalor1, Alvo),
    h(No2, Hvalor2, Alvo),
	F1 is Custo1 + Hvalor1,
    F2 is Custo2 + Hvalor2,
	F1 =< F2.


insere(X,[],[X],_).
insere(X,[Y|T],[Y|NT],Alvo):- 
    menos(Y,X,Alvo),
    insere(X,T,NT,Alvo).

insere(X,[Y|T],[X,Y|T],Alvo):-
    menos(X,Y,Alvo).


addFronteira([],X,X,_).
addFronteira([Head|X],Resto,Novo,Alvo) :-
    insere(Head,Resto,Result,Alvo),
	addFronteira(X,Result,Novo,Alvo).


%encontrei essa regra na internet
arc([N,Cost],M,Seed,_) :- A is N*Seed, B is Cost+1, M = [A,B].
arc([N,Cost],M,Seed,_) :- A is N*Seed + 1, B is Cost+2, M = [A,B].


busca([[No,Custo] | FResto], _, Alvo, [No, Custo]) :- objetivo(No, Alvo).
busca([[No,Custo] | FResto], Seed, Alvo, Found) :-
	setof(X, arc([No, Custo], X, Seed, Alvo), FNo),
	addFronteira(FNo, FResto, Result, Alvo),
	busca(Result, Seed, Alvo, Found).

% a star search
aEstrela(Start,Seed,Target,Found) :- busca([[Start,0]|[]],Seed,Target,Found).
