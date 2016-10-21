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

hanoi(Disk,[S1|S],[D1|D],[A1|A,D1]):-Disk>0,Disk2 is Disk-1,hanoi(Disk2,[S1|S],[A1|A],[D1|D]),hanoi(Disk2,)
