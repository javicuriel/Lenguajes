insertionSort [] = []
insertionSort (h:[]) = [h]

-- Insertion con recursividad normal
-- insertionSort (h:t) = let insert num [] = [h]
--                           insert num (h:t) = if num > h
--                                          then [h] ++ (insert num t)
--                                          else [num] ++ [h] ++ t
--                       in
--                          insert h (insertionSort t)

-- Insertion con list compression
insertionSort (h:t) = let lc x lista = [y | y<-lista,x>=y] ++ [x] ++ [y | y<-lista,x<y]
                      in  lc h (insertionSort t)
