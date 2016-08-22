
-- Exactitud con un limite de iteraciones
-- raiz x = raizI (1,0,x)
-- raizI (x,i,n) = if i > 20 then x else raizI ((x+n/x)/2,i+1,n)


-- Exactitud con un limite de tamaño de resultado (mas exacto)
raiz x = raizI (1,(1+x/1)/2,x)
raizI (x,i,n) = if x==i then x else raizI ((x+n/x)/2,(i+n/i)/2,n)
