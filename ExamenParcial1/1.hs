fibonacci n = fibo n []
fibo 1 [] = 0
fibo 2 [] = 1
fibo n []  = fibo n [0,1]
fibo n lista = if length(lista) == n then last(lista) else fibo n (lista ++ [last(lista)+last(init (lista))])
