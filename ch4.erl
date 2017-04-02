-module(ch4).
-export([
    temp_convert/1, 
    for/3, 
    sum/1, 
    map/2, 
    qsort/1,
    pythag/1,
    perms/1,
    max/2,
    odds_and_evens/1
]).
-import(lists, [reverse/1]).

temp_convert({c,C}) -> {f, 32 + C * 9/5};
temp_convert({f,F}) -> {c, (F-32) * 5/9}.

%% for loop
for(Max, Max, F) -> [F(Max)];
for(I, Max, F)   -> [F(I) | for(I + 1, Max, F)].

%% lists
sum([H|T]) -> H + sum(T);
sum([])    -> 0.

map(_, []) -> [];
map(F, [H|T]) -> [F(H)|map(F,T)].

%% *avoid using ++ in production code
qsort([]) -> [];
qsort([Pivot|T]) ->
    qsort([X || X <- T, X < Pivot])
    ++ [Pivot] ++
    qsort([X || X <- T, X >= Pivot]).

pythag(N) ->
    [{A,B,C} ||
        A <- lists:seq(1,N),
        B <- lists:seq(1,N),
        C <- lists:seq(1,N),
        A + B + C =< N,
        A*A + B*B =:= C*C
    ].

perms([]) -> [[]];
perms(L)  -> [[H|T] || H <- L, T <- perms(L -- [H])].

max(X,Y) when X > Y -> X;
max(_,Y) -> Y.

odds_and_evens(L) -> odds_and_evens_acc(L, [], []).

odds_and_evens_acc([H|T], Odds, Evens) ->
    case (H rem 2) of
        1 -> odds_and_evens_acc(T, [H|Odds], Evens);
        0 -> odds_and_evens_acc(T, Odds, [H|Evens])    
    end;
odds_and_evens_acc([], Odds, Evens) ->
    {reverse(Odds), reverse(Evens)}.






