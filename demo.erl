-module(demo).
-export([convert/1, perimeter/1, list_min/1, list_max/1, list_minmax/1,
        swedish_date/0]).

swedish_date() ->
    {Y,M,D} = date(),
    if
        M < 10 ->
            Sm = "0" ++ integer_to_list(M);
        M >= 10 ->
            Sm = integer_to_list(M)
    end,

    if
        D < 10 ->
            Sd = "0" ++ integer_to_list(D);
        D >= 10 ->
            Sd = integer_to_list(D)
    end,

    integer_to_list(Y-2000) ++ Sm ++ Sd.

f2c(F) -> trunc(5/9 * (F - 32)).
c2f(C) -> trunc(9/5 * C  + 32).

convert({c,T}) -> {f,c2f(T)};
convert({f,T}) -> {c,f2c(T)}.

perimeter({square, Side}) -> Side * 4;
perimeter({circle, Radius}) -> 2 * 3.14 * Radius;
perimeter({triangle, A, B, C}) -> A + B + C.

list_minmax(L) -> {list_min(L), list_max(L)}.

list_min({[H|T], Min}) when H < Min ->
    list_min({T, H});

list_min({[H|T], Min}) ->
    list_min({T, Min});

list_min([H|T]) -> list_min({T, H});

list_min({[],Min}) -> Min.


list_max({[H|T], Max}) when H > Max ->
    list_max({T, H});

list_max({[H|T], Max}) ->
    list_max({T, Max});

list_max([H|T]) -> list_max({T, H});

list_max({[],Max}) -> Max.
