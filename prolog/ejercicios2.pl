max([H|T], Out):-max(H,T,Out).
max(X,[],Out):-Out is X.
max(X,[H|T],Out):-(X>H -> max(X,T,Out);max(H,T,Out)).

min([H|T], Out):-min(H,T,Out).
min(X,[],Out):-Out is X.
min(X,[H|T],Out):-(X<H -> min(X,T,Out);min(H,T,Out)).


myAppend([],L,L).
myAppend([H|T],L,[H|R]):-myAppend(T,L,R).

/* quicksort(Xs, Ys) is true if Ys is a sorted permutation of the list Xs. */
quicksort(Xs, Ys):-quicksort_1(Xs, Ys, []).

quicksort_1([], Ys, Ys).
quicksort_1([X|Xs], Ys, Zs):-
  partition(Xs, X, Ms, Ns),
  quicksort_1(Ns, Ws, Zs),
  quicksort_1(Ms, Ys, [X|Ws]).

/* partition(Ls, X, Ms, Ns) is true if the list Ms contains the elements   */
/*   of the list Ls which are less than or equal to X, and the list Ns     */
/*   contains the elements of Ls which are greater than X.                 */
partition([K|L], X, M, [K|N]):-
  X < K, !,
  partition(L, X, M, N).
partition([K|L], X, [K|M], N):-
  partition(L, X, M, N).
partition([], _, [], []).

bucketSort(isBucket(_,_,[]),isBucket(_,_,[]),[]).
bucketSort(isBucket(A,B,[H|R]),isBucket(C,D,List),[H|T]):-H=<B,H>=A,bucketSort(isBucket(A,B,R),isBucket(C,D,List),T).
bucketSort(isBucket(A,B,List),isBucket(C,D,[H|R]),[H|T]):-H>=C,H=<D,bucketSort(isBucket(A,B,List),isBucket(C,D,R),T).

sortBuck(List,[A2,B2]):-bucketSort(isBucket(1,5,A),isBucket(6,10,B),List),quicksort(A,A2),quicksort(B,B2).


delete(_,[],[]).
delete(X,[X|T],T):-delete(X,T,_).
delete(X,[H|T],[H|T2]):-delete(X,T,T2).


selectionSort([],[]).
selectionSort(List,[Min|Rest]):-min(List,Min), delete(Min,List,L2),selectionSort(L2,Rest).
