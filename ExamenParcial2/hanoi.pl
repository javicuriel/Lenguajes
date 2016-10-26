% START
% Procedure Hanoi(disk, source, dest, aux)
%
%    IF disk == 0, THEN
%       move disk from source to dest
%    ELSE
%       Hanoi(disk - 1, source, aux, dest)     // Step 1
%       move disk from source to dest          // Step 2
%       Hanoi(disk - 1, aux, dest, source)     // Step 3
%    END IF
%
% END Procedure
% STOP

app([],L,L).
app([H|T],L,[H|R]):-app(T,L,R).

% No funciona bien el pop
pop([_],_,[]).
pop([H|[]],H,[]).
pop([H|T],P,[H|R]):-pop(T,P,R).


add_stack( Item, Stack, [Item|Stack] ).
remove_stack( [Item|RestStack], Item, RestStack ).


hanoi(N):-hanoi(N,'A','C','B').
writeHan(N,A,B):-write('Mueve el disco '), write(N), write(' de '), write(A), write(' a '), write(B), nl.
hanoi(1,A,B,_):-writeHan(1,A,B).
hanoi(N,A,B,C):- N>1, N2 is N-1, hanoi(N2,A,C,B), writeHan(N,A,B), hanoi(N2,C,B,A).

writeHanL(Pegs,Start,Target):-write(Start), write(' -> '), write(Target), write(': '), write(Pegs), nl.
hanoiL(Pegs,Start,Target,1):-Aux is 3-Start-Target,getPos(Pegs,Start,PegStart),getPos(Pegs,Target,PegTarget),getPos(Pegs,Aux,PegAux),remove_stack(PegStart,P,NewPegStart), add_stack(P,PegTarget,NewPegTarget), writeHanL([NewPegStart,PegAux,NewPegTarget],Start,Target).
hanoiL(Pegs,Start,Target,N):-N>1,Aux is 3-Start-Target, N2 is N-1,hanoiL(Pegs,Start,Aux,N2),hanoiL(Pegs,Start,Target,1),hanoiL(Pegs,Aux,Target,N2).

getPos([H|_],0,H).
getPos([H|T],New,E):-N2 is New-1,getPos(T,N2,E).

size([],0).
size([_|T],Size):-size(T,S),Size is S+1.
