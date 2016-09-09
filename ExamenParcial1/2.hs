saca = maximum(fun (listProduct[100..999]))

listProduct xs = [x * y | x <- xs, y <- xs]

fun xs = [x | x<- xs, esPali (sacaNum x) x]

sacaNum n = regresa (divideR n)

esPali n m = if n == m then True else False

-- Divide numero en arreglo
divideR 0 = []
divideR n = [n `mod` 10]++ divideR (n`div`10)
-- Regresa un numero dividido en arreglo a Int
regresa lista =(read $ concat $ map (show) lista) :: Int
