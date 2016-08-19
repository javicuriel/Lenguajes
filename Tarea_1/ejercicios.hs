fact 1 = 1
fact x = x * fact(x-1)

maximo [] = []
maximo (x:[])= x
maximo (a:b:c) = let bigger (a,b) = if a > b then a else b in if c==[] then bigger(a,b) else maximo ([bigger(a,b)]++c)
