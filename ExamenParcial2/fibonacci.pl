fibonacci([H1,H2],0,R).
fibonacci([H1,H2],T,[H3|R]):-T>0,H3 is H1+H2,T2 is T-1,fibonacci([H2,H3],T2,R).
