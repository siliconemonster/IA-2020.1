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

objetivo((_, 2)). % objetivo( (Qual jarra, Quantos litros) )

