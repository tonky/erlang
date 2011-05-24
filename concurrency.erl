-module(concurrency).
-export([mtimes/0, bouncer/0]).

mtimes() ->
    io:format("mtimes: ~w~n", [1]),
    B1 = spawn(concurrency, bouncer, []),
    B2 = spawn(concurrency, bouncer, []),
    Self = self(),
    register(main, Self),
    io:format("sending to bouncer~n"),
    B1 ! {B2, 1},

    receive
        {From, X} ->
            io:format("Got from bouncer: ~w~n", [X]),
            {From, X}
    end.


bouncer() ->
    io:format("Spawned bouncer: ~w~n", [self()]),

    receive
        {From, X} when X==10 ->
            io:format("X is ten!: ~w~n",[X]),
            From ! stop,
            io:format("sending to main: ~w~n",[main]),
            main ! {self(), X},
            true;
        {From, X} ->
            io:format("X: ~w~n",[X]),
            io:format("From ~w~n",[From]),
            From ! {self(), X+1},
            bouncer();
        stop ->
            io:format("bouncer stopping self~n"),
            true
    end.
