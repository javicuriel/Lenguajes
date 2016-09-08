-- Pruebas
-- primeList n = [x | x<-n, all(\z -> x `mod` z /= 0)[2..x-1]]
-- primeList2 n = [x | x<-n, all(\z -> x `mod` z /= 0)[3,5..x-1]]
-- primeList3 n = [x | x<-n, all(\z -> x `mod` z /= 0)[3,5.. ceiling (sqrt (fromIntegral x))]]



primeNumber 1 = 2
primeNumber n = check (0,1,0,n)
check (num,n,i,f) = if i == f then num else if prime n then check(n,n+2,i+1,f) else check(n+2,n+2,i,f)
prime n = all(\z -> n `mod` z /= 0)[3,5.. ceiling (sqrt (fromIntegral n))]
