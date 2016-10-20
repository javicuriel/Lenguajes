% Posicion de elemento en una lista
inList(X,[X|_],Cont,Z):-Z is Cont.
inList(X,[H|T],Cont,Z):- inList(X,T,Cont+1,Z).

% Maximo de una lista
max([H|T], Out):-max(H,T,Out).
max(X,[],Out):-Out is X.
max(X,[H|T],Out):-(X>H -> max(X,T,Out);max(H,T,Out)).

natural(0,0).
natural(suc(X),N):-natural(X,S),N is S+1.

dlength([],0).
dlength([_|T],Size):-dlength(T,S),Size is S+1.


isLast([H|[]],H).
isLast([_|T],S):-isLast(T,S).

myAppend([],L,L).
myAppend([H|T],L,[H|R]):-myAppend(T,L,R).

delete(_,[],[]).
delete(X,[X|T],Sol):-delete(X,T,Sol).
delete(X,[H|T],[H|T2]):-delete(X,T,T2).
