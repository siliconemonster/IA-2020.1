fibonacci(1, 0).
fibonacci(2, 1).
fibonacci(N, F) :-
    N > 2, % N = 1 e N = 2 já estão indicados acima como fatos
   	   % a restrição é necessária para garantir que números negativos dão falso
    
    N1 is N - 1,
    N2 is N - 2,
    fibonacci(N1, F1),
    fibonacci(N2, F2),
    F is F1 + F2.