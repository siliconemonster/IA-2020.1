/*
 * Faça um programa Prolog que dado um mapa qualquer,
 * define uma coloração para o mapa usando 4 cores de
 * tal forma que nenhuma região adjacente será pintada
 * com a mesma cor.
 * 
 * Comente seu programa, indicando como os mapas e cores
 * são definidos, além de explicar como o mesmo processa
 * as respostas. Lembre de definir como deve ser feita 
 * uma consulta.
 */

/*
 * Exemplo de mapa de entrada:
 * [[pais1 | [pais2, pais3, pais4, pais5]],
 *  [pais2 | [pais1, pais3, pais4]],
 *  [pais3 | [pais1, pais2, pais4]],
 *  [pais4 | [pais1, pais2, pais3, pais5]],
 *  [pais5 | [pais1, pais4]]],
 *  onde a cabeça da lista de cada linha representa o país, e a cauda representa suas adjacências.
 * 
 * A consulta deve ser feita da sequinte forma:
 * ?-coloreMapa([[Pais1 | [Pais2, Pais3, Pais4, Pais5]], [Pais2 | [Pais1, Pais3, Pais4]], [Pais3 | [Pais1, Pais2, Pais4]], [Pais4 | [Pais1, Pais2, Pais3, Pais5]], [Pais5 | [Pais1, Pais4]]]).
 * 
 * O programa mostrará todas as possibilidades de se colorir o mapa.
 */
        
% Fatos que as cores escolhidas são diferentes umas das outras.
% O programa tenta encaixar os países dados nas cores abaixo, dizendo ao final de sua execução qual país ficou 
% com qual cor.
diferentes(preto, rosa).
diferentes(rosa, preto).
diferentes(preto, roxo).
diferentes(roxo, preto).
diferentes(preto, amarelo).
diferentes(amarelo, preto).
diferentes(rosa, roxo).
diferentes(roxo, rosa).
diferentes(rosa, amarelo).
diferentes(amarelo, rosa).
diferentes(roxo, amarelo).
diferentes(amarelo, roxo).       

% Casos base
coloreMapa([]). % quando esgota o mapa passado como entrada.
coloreMapa([[_|[]]|Z]) :- coloreMapa(Z). % quando esgota as adjacêcias do país que está sendo avaliado no momento.


% Regra geral
coloreMapa([[X|[Y1|Y2]]|Z]) :- 
    diferentes(X,Y1), % Diz que o país X será colorido diferente da cabeça Y1 da lista de adjências.
    coloreMapa([[X|Y2]|Z]). % percorre o restante da lista de adjacências.