% Posicion de elemento en una lista
inList(X,[X|_],Cont,Z):-Z is Cont.
inList(X,[H|T],Cont,Z):- inList(X,T,Cont+1,Z).

% Maximo de una lista
max([H|T], Out):-max(H,T,Out).
max(X,[],Out):-Out is X.
max(X,[H|T],Out):-(X>H -> max(X,T,Out);max(H,T,Out)).
