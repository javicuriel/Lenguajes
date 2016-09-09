saca = last(fun (zipWith (*) [100..999] [100..999]))
fun xs = [x | x<- xs, estaEnLista (sacaNum x) xs]

sacaNum n = regresa (divideR n)

estaEnLista _ [] = False
estaEnLista n (h:t) = if n == h then True else estaEnLista n t


-- Divide numero en arreglo
divideR 0 = []
divideR n = [n `mod` 10]++ divideR (n`div`10)
-- Regresa un numero dividido en arreglo a Int
regresa lista =(read $ concat $ map (show) lista) :: Int
