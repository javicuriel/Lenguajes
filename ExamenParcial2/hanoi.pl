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



hanoi(0,_,_,_).
hanoi(N,Start,Aux,Target):-N>0,N2 is N-1,hanoi(N2,Start,Target,Aux),remove_stack(Start,P,Start2),add_stack(P,Target,Target2),hanoi(N2,Aux,Start2,Target2).

% hanoi(Disk,[S1|S],[D1|D],[A1|A]):-Disk>0,Disk2 is Disk-1,hanoi(Disk2,[S1|S],[A1|A],[D1|D]),hanoi(Disk2,[A1|A],[D1|D],)
%
% hanoi(Disk,S,D,A):-Disk>0,hanoi()
