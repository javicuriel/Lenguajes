fun xs = head([x | x<-xs, all(\z -> x `mod` z==0)[1..20]])
