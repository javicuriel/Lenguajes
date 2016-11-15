height(empty,0).

height(node(_,Left,Right),Sol):-height(Left,SL),height(Right,SR),Sol is max(SL,SR)+1.

factor(node(_,Left,Right),Sol):-height(Left,L),height(Right,R),Sol is L-R.

leftRotation(node(APadre,PadreLeft,node(APivote,PivotLeft,PivoteRight)),node(APivote,node(APadre,PadreLeft,PivotLeft),PivoteRight)).
% rightRotation(node(APadre,node(APivote,PivotLeft,PivoteRight),PadreRight),node(APivote,PivotLeft,node(APadre,PadreRight,PivoteRight))).
rightRotation(node(F,node(P,PL,PR),FR),node(P,PL,node(F,PR,FR))).
rightLeft(node(P,PLeft,PRight),N):-leftRotation(PLeft,LeftR),rightRotation(node(P,LeftR,PRight),N).
leftRight(node(P,Pleft,PRight),N):-rightRotation(PRight,RightR), leftRotation(node(P,Pleft,RightR),N).

insert(A,empty,node(A,empty,empty)).
insert(A,node(I,L,R),Out):-I>A,insert(A,L,NewL),balance(node(I, NewL, R), Out).
insert(A,node(I,L,R),Out):-I<A,insert(A,R,NewR),balance(node(I,L,NewR), Out).


balance(empty, empty).

balance(node(I,L,R),NewTree):-factor(node(I,L,R),Fac),2=:=Fac,factor(L,Left),-1=:=Left,rightLeft(node(I,L,R),NewTree).
balance(node(I,L,R),NewTree):-factor(node(I,L,R),Fac),2=:=Fac,rightRotation(node(I,L,R),NewTree).

balance(node(I,L,R),NewTree):-factor(node(I,L,R),Fac),-2=:=Fac,factor(R,Right),1=:=Right,leftRight(node(I,L,R),NewTree).
balance(node(I,L,R),NewTree):-factor(node(I,L,R),Fac),-2=:=Fac,leftRotation(node(I,L,R),NewTree).

balance(node(I,L,R),node(I,L,R)) :- factor(node(I,L,R),Fac),2\=Fac,-2\=Fac.


insertList([],Tree,Tree).
insertList([H|T],Tree,N):-insert(H,Tree,NewTree),insertList(T,NewTree,N).


insertAVL([H|T],Tree):-insertList(T,node(H,empty,empty),Tree).

inorder(empty,[]).
inorder(node(A,L,R),List):-inorder(L,LeftList),append(LeftList,[A|RightList],List),write(A),inorder(R,RightList).
