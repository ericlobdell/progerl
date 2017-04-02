-module(shop).
-export([cost/1, total/1, totalm/1, totalc/1]).
-import(ch4, [map/2, sum/1]).

cost(oranges)   -> 5;
cost(newspaper) -> 8;
cost(apples)    -> 2;
cost(pears)     -> 9;
cost(milk)      -> 7.

total([{What, N}|T]) -> cost(What) * N + total(T);
total([])            -> 0.

%% using map
totalm(L) -> sum(map( fun({What,N}) -> cost(What) * N end , L)).
%% using list comprehension
totalc(L) -> sum([cost(A) * B || {A,B} <- L]).

