raiz x = raizI (1,0,x)
raizI (x,i,n) = if i > 20 then x else raizI ((x+n/x)/2,i+1,n)
