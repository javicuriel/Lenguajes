fact 1 = 1
fact x = x * fact(x-1)

maximo [] = []
maximo (x:[])= x
maximo (a:b:c) = let bigger (a,b) = if a > b then a else b in if c==[] then bigger(a,b) else maximo ([bigger(a,b)]++c)

-- Aproach Normal
let factorialCola (x,suma) = if x == 1 then suma else factorialCola(x-1,suma*x)
let factCola(x) = factorialCola(x,1)

-- Pattern matching
fact 0 sol = sol
fact 1 sol = sol
fact x sol = fact(x-1)(x*sol)

insertionSort (a:b:c) final = let smaller(a,b) = if a > b then insertionSort(c) final++b,a

insertionSort (x,xs) =

-- Calcular raizes con newton y quick sort
-- Para el viernes
