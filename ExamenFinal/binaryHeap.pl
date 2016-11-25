
%Get pos of element
getPosH(A,I,[A|T],I).
getPosH(A,I,[H|T],N):-I2 is I+1,getPosH(A,I2,T,N).
getPos(A,L,N):-getPosH(A,1,L,N).

% Get element at pos
getLoc(N,N,[H|L],H).
getLoc(N,I,[H|L],A):-I2 is I+1,getLoc(N,I2,L,A).

insertAt(empty,I,N,List,List).
insertAt(A,N,N,[H|T],[A|List]):-insertAt(empty,I,N,T,List).
insertAt(A,I,N,[H|L],[H|List]):-I2 is I+1,insertAt(A,I2,N,L,List).

insert(X,[ ],[X]).
insert(X,[H|T],[H|Z]) :- insert(X,T,Z).

check(X,K,LastK,List,NewList):-K=:=1,getLoc(K,1,List,Switch),insertAt(Switch,1,LastK,List,TempList),insertAt(X,1,K,TempList,NewList).
check(X,K,LastK,List,NewList):-K2 is floor(K/2),getLoc(K2,1,List,Parent),Parent<X,getLoc(K,1,List,Switch),insertAt(Switch,1,LastK,List,TempList),check(X,K2,K,TempList,NewList).
check(X,K,LastK,List,NewList):-K2 is floor(K/2),getLoc(K2,1,List,Parent),Parent>X,insertAt(X,1,LastK,List,NewList).

insertList([],List,List).
insertList([H|L],List,N):-insert(H,List,NewList),getPos(H,NewList,Pos),check(H,Pos,Pos,NewList,NewTList),insertList(L,NewTList,N).


nodeInsert(N, empty, node(N,empty,empty)).
nodeInsert(N, node(E,Left,Right), node(E, Left, NewRight)):- N>E, nodeInsert(N, Right, NewRight).
nodeInsert(N, node(E,Left,Right), node(E,NewLeft,Right)):-N<E, nodeInsert(N, Left, NewLeft).

listNode([],Tree,Tree).
listNode([H|T],Tree,N):-listNode(H,Tree,NewTree),listNode(T,NewTree,N).
