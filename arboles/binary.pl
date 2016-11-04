insert(N, empty, node(N,empty,empty)).
insert(N, node(E,Left,Right), node(E, Left, NewRight)):- N>E, insert(N, Right, NewRight).
insert(N, node(E,Left,Right), node(E,NewLeft,Right)):-N<E, insert(N, Left, NewLeft).

insertList([],Tree,Tree).
insertList([H|T],Tree,N):-insert(H,Tree,NewTree),insertList(T,NewTree,N).
