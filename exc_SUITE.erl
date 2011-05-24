-module(exc_SUITE).
-include_lib("common_test/include/ct.hrl").
-compile(demo).
-compile(concurrency).
-compile(export_all).

all() -> [demo, conc].

conc(Config) ->
    {_,10} = concurrency:mtimes().

demo(Config) ->
    "110522" = demo:swedish_date(),
    16 = demo:perimeter({square,4}),
    43.96 = demo:perimeter({circle, 7}),
    6 = demo:perimeter({triangle, 1, 2, 3}),
    {f,212} = demo:convert({c,100}),
    {c,0} = demo:convert({f,32}),
    2 = demo:list_min([5,12,4,2,7]),
    12 = demo:list_max([5,12,4,2,7]),
    {2,12} = demo:list_minmax([5,12,4,2,7]).
