% Tarefa 2 - Problema das Jarras (2020.01.06)
%
% A jarra 1 tem capacidade de 4 litros e a jarra 2 tem capacidade de 3 litros.
% Inicialmente, as jarras estão vazias.
% O objetivo do problema é colocar 2 litros de água na jarra 1.
% As ações que podemos fazer são:
%    – encher completamente as jarras (representadas pelas constantes encher1, encher2)
%    – esvaziar completamente as jarras (representadas pelas constantes esvaziar1, esvaziar2)
%    – passar a água de uma jarra para outra (representadas pelas constantes passar12, passar21)
% Vamos representar o conteúdo das jarras usando o par ordenado (J1, J2) onde J1 ∈ [0, 4] e J2 ∈ [0, 3].

% a)

objetivo((J1, 2)). % objetivo( (Qual jarra, Quantos litros) )


% b)
% creio que não posso deixar transbordar

acao((J1, J2), encher1, (4, J2)) :- J1 < 4.	% Jarra 1 fica totalmente cheia e jarra 2 não se altera
acao((J1, J2), encher2, (J1, 3)) :- J2 < 3.	% Jarra 2 fica totalmente cheia e jarra 2 não se altera
acao((J1, J2), esvaziar1, (0, J2)) :- J1 > 0.	% Jarra 1 com o totalmente vazia e jarra 1 não se altera
acao((J1, J2), esvaziar2, (J1, 0)) :- J2 > 0.	% Jarra 2 com o totalmente vazia e jarra 1 não se altera

acao((J1, J2), passar12, (J1a, J2a)) :- 
    J1 > 0,					% Não pode estar totalmente vazia
    J2 < 3,					% Não pode estar totalmente cheia
    3 - J2 < J1,
    J1a is J1 - (3 - J2),
    J2a is J2 + (3 - J2).

acao((J1, J2), passar12, (J1a, J2a)) :-
    J1 > 0,					% Não pode estar totalmente vazia
    J2 < 3,					% Não pode estar totalmente cheia
    3 - J2 >= J1,
    J1a is 0,					%lida com o problema da jarra 1 com litro negativo
    J2a is J2 + J1.

acao((J1, J2), passar21, (J1a, J2a)) :-
    J1 < 4,					% Não pode estar totalmente cheia
    J2 > 0,					% Não pode estar totalmente vazia
    4 - J1 < J2,
    J1a is J1 + (4 - J1),
    J2a is J2 - (4 - J1).

acao((J1, J2), passar21, (J1a, J2a)) :-
    J1 < 4,					% Não pode estar totalmente cheia
    J2 > 0,					% Não pode estar totalmente vazia
    4 - J1 >= J2,
    J2a is 0,					%lida com o problema da jarra 2 com litro negativo
    J1a is J1 + J2.


% c)

vizinho(N, FilhosN) :- findall(N2, acao(N, _, N2), FilhosN). % N2 na primeira posição do findall porque quero os estados pós ações

% d)

% largura
addFronteiraL(FilhosN, F1, F2) :- append(F1, FilhosN, F2).

bfs([Node|_]) :- objetivo(Node), !.
bfs([Node|F1]) :-
    vizinho(Node, FilhosN),
    addFronteiraL(FilhosN, F1, F2),
    bfs(F2).

% Consulta: ?- (bfs([0,0])).
% O programa só retorna true/false. No caso do objetivo determinado pela letra a), só retorna false.
% Quando a busca é executada, a árvore não está sendo salva. Este é o motivo desse retorno.

% ------------------ versão com busca em profundidade pedida na letra g
% profundidade
addFronteiraP(FilhosN, F1, F2) :- append(FilhosN, F1, F2).

dfs([Node|_]) :- objetivo(Node), !.
dfs([Node|F1]) :-
    vizinho(Node, FilhosN),
    addFronteiraL(FilhosN, F1, F2),
    dfs(F2).


% Consulta: ?- (dfs([0,0])).
% Novamente o programa só retorna true/false, também por a árvore não estar sendo salva.