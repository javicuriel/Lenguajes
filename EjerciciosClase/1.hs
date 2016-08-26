operacion f (hx:tx) (hy:ty) =[f hx hy] ++ operacion f tx ty
operacion _ _ _ = []


--Con Ifs
op _ [] = []
op f (hx:tx) = if f hx then hx:op f tx else op f tx

--Ariel
op f [] = []
op f (hx:tx)
 | f hx = hx:op f tx
 | otherwise = op f tx


--List compresion
let f n list = [x | x<-lista,x`f`n]

-- Con Ifs

func  [] = 0
func lista = if last lista `mod` 4929 == 0 then last lista else func (init lista)

-- Con Pipes

func  [] = 0
func lista
   | last lista `mod` 4929 == 0 = last lista
   | otherwise = func (init lista)
