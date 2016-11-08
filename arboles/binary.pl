insert(N, empty, node(N,empty,empty)).
insert(N, node(E,Left,Right), node(E, Left, NewRight)):- N>E, insert(N, Right, NewRight).
insert(N, node(E,Left,Right), node(E,NewLeft,Right)):-N<E, insert(N, Left, NewLeft).

insertList([],Tree,Tree).
insertList([H|T],Tree,N):-insert(H,Tree,NewTree),insertList(T,NewTree,N).

inorder(empty,[]).
inorder(node(A,L,R),List):-inorder(L,LeftList),append(LeftList,[A|RightList],List),write(A),inorder(R,RightList).

postorder(empty,[]).
postorder(node(A,L,R),List):-postorder(L,LeftList),postorder(R,RightList),write(A),append(LeftList,RightList,NewList),append(NewList,[A],List).
