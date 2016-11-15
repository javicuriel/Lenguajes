height(empty,0).

height(node(_,Left,Right),Sol):-height(Left,SL),height(Right,SR),Sol is max(SL,SR)+1.

factor(node(_,Left,Right),Sol):-height(Left,L),height(Right,R),Sol is L-R.

leftRotation(node(APadre,PadreLeft,node(APivote,PivotLeft,PivoteRight)),node(APivote,node(APadre,PadreLeft,PivotLeft),PivoteRight)).

rightRotation(node(APadre,node(APivote,PivotLeft,PivoteRight),PadreRight),node(APivote,PivotLeft,node(APadre,PadreRight,PivoteRight))).

leftRight(node(P,PLeft,PRight),N):-leftRotation(PLeft,LeftR),rightRotation(node(P,LeftR,PRight),N).

rightLeft(node(P,Pleft,PRight),N):-rightRotation(PRight,RightR),leftRotation(node(P,RightR,Pleft),N).

getRight(node(A,_,_),0,A).
getRight(node(_,_,R),N,Res):-N>0,N2 is N-1,getRight(R,N2,Res).

getLeft(node(A,_,_),0,A).
getLeft(node(_,L,_),N,Res):-N>0,N2 is N-1,getLeft(L,N2,Res).

insert(A,empty,node(A,empty,empty)).

insert(A,node(I,L,R),node(I,NewL,R)):-I>A,insert(A,L,NewL).

insert(A,node(I,L,R),node(I,L,NewR)):-I<A,insert(A,R,NewR).

balance(node(I,L,R),A,NewTree):-factor(node(I,L,R),Fac),(Fac>1->getLeft(node(I,L,R),1,Left),(A<Left->rightRotation(node(I,L,R),NewTree);leftRight(node(I,L,R),NewTree));(-1>Fac->getRight(node(I,L,R),1,Right),(A>Right->leftRotation(node(I,L,R),NewTree);rightLeft(node(I,L,R),NewTree));NewTree = node(I,L,R))).

insertList([],Tree,Tree).
insertList([H|T],Tree,N):-insertBalance(H,Tree,NewTree),insertList(T,NewTree,N).

inorder(empty,[]).
inorder(node(A,L,R),List):-inorder(L,LeftList),append(LeftList,[A|RightList],List),write(A),inorder(R,RightList).

insertBalance(A,node(I,L,R),NewTree):-insert(A,node(I,L,R),InsertTree),balance(InsertTree,A,NewTree).

% inserta(A,node(I,L,R),NewTree):-insert(A,node(I,L,R),InsertTree),factor(node(I,L,R),Fac),(Fac>1;-1>Fac->balance(InsertTree,A,NewTree);NewTree = InsertTree).

% leftRotation(node(7,node(6,empty,empty),node(9,node(8,empty,empty),node(10,empty,node(11,empty,empty)))),N).
%
% height(node(7,node(6,empty,empty),node(9,node(8,empty,empty),node(10,empty,node(11,empty,empty)))),N).
