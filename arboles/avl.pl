height(empty,0).
height(node(_,Left,Right),Sol):-height(Left,SL),height(Right,SR),Sol is max(SL,SR)+1.

factor(node(_,Left,Right),Sol):-height(Left,L),height(Right,R),Sol is L-R.

leftRotation(node(APadre,PadreLeft,node(APivote,PivotLeft,PivoteRight)),node(APivote,node(APadre,PadreLeft,PivotLeft),PivoteRight)).

% leftRotation(node(7,node(6,empty,empty),node(9,node(8,empty,empty),node(10,empty,node(11,empty,empty)))),N).
%
% height(node(7,node(6,empty,empty),node(9,node(8,empty,empty),node(10,empty,node(11,empty,empty)))),N).
