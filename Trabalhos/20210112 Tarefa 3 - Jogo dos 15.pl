% Tarefa 3 - Jogo dos 15 (2021.01.12)

estado( [[A,B,C,D],   % Nessa situação, posso ter qualquer número em qualquer lugar, com exceção no espaço branco
	 [E,F,G,H],
	 [I,J,K,L],
	 [M,N,O,v]]). % v é espaço vazio

estadoFinal([[1, 2, 3, 4],
             [5, 6, 7, 8],
	     [9,10,11,12],
	     [13,14,15,v]]).

% Movimentos:
% Nessa parte, a ação de movimentar é do tipo ação(X,Y), onde X é o estado antes dessa ação e Y é o estado depois
	
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