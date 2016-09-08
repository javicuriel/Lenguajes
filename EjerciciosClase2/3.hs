circulares x = final (quitaPares(primes x))

primes n = primeList [3,5..n]
primeList n = [2]++[x | x<-n, all(\z -> x `mod` z /= 0)[3,5.. ceiling (sqrt (fromIntegral x))]]

-- Quita todos los pares
quitaPares xs = [2]++[x | x <- xs, check (divide x)]

-- Divide numero en arreglo
divide 0 = []
divide n = divide (n`div`10) ++ [n `mod` 10]
-- Regresa un numero dividido en arreglo a Int
regresa lista =(read $ concat $ map (show) lista) :: Int

-- Quita todas los pares
check [] = True
check (h:t) = if h `mod` 2 == 0 then False else check t

--Checa si numero esta en la lista
estaEnLista _ [] = False
estaEnLista n (h:t) = if n == h then True else estaEnLista n t

--Rota el numero
rota ([n],_,_) = True
rota ((h:t),lista,i) = let numR = [last(t)] ++ [h] ++ init(t)
                     in if i == length(numR) then True else if estaEnLista (regresa numR) lista then rota (numR,lista,i+1) else False

final [] = []
final xs = [x | x <- xs, rota (divide x,xs,0)]
