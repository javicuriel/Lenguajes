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
balance(node(I,L,R),NewTree):-factor(node(I,L,R),Fac),2=:=Fac,factor(L,Left),-1\=Left,rightRotation(node(I,L,R),NewTree).

balance(node(I,L,R),NewTree):-factor(node(I,L,R),Fac),-2=:=Fac,factor(R,Right),1=:=Right,leftRight(node(I,L,R),NewTree).
balance(node(I,L,R),NewTree):-factor(node(I,L,R),Fac),-2=:=Fac,factor(R,Right),1\=Right,leftRotation(node(I,L,R),NewTree).

balance(node(I,L,R),node(I,L,R)):-factor(node(I,L,R),Fac),2\=Fac,-2\=Fac.


insertList([],Tree,Tree).
insertList([H|T],Tree,N):-insert(H,Tree,NewTree),insertList(T,NewTree,N).

deleteAVL([],Tree,Tree).
deleteAVL([H|T],Tree,N):-delete(Tree,H,NewTree),deleteAVL(T,NewTree,N).

insertAVL([H|T],Tree):-insertList(T,node(H,empty,empty),Tree).


% First case, delete a lief
delete(node(X, empty, empty), X, empty).

%second case, delete a parent of one child
delete(node(X, node(Y, Left, Right), empty), X, node(Y, Left, Right )).
delete(node(X,empty, node(Y, Left, Right)), X, node(Y, Left, Right )).

%third case, father of two childs
delete(node(X,Left,Right),X,node(NewX,NewL,Right)):-
  maxNode(Left,NewX),delete(Left,NewX,NewL).

maxNode(node(X,empty,empty),X).
maxNode(node(_,_,R),X):-maxNode(R,X).

delete(node(X, node(Left, Lx, Ly), R), Key, Tree):-
  X > Key,
  delete(node(Left, Lx, Ly) ,Key , Out),balance(node(X, Out, R),Tree).

delete(node(X, L, node(Right, Rx, Ry)), Key, Tree):-
  X < Key,
  delete(node(Right, Rx, Ry), Key, Out),balance(node(X, L, Out),Tree).
