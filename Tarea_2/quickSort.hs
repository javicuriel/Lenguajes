qs [] = []
qs (h:t) = let left = [x | x<- t,x < h]
               right = [x | x<-t , x>= h]
           in qs left ++ [h] ++ qs right
