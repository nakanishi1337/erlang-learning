-module(doctor).

-export([loop/0]).

loop() ->
    process_flag(trap_exit, true),
    receive
        {new, From} ->
            io:format("Creating and monitoring process.~n"),
            register(translator, spawn_link(fun translate_service:loop/0)),
            From ! ok,
            loop();
        {'EXIT', Pid, Reason} ->
            io:format("The translator ~p died with reason ~p.", [Pid, Reason]),
            io:format(" Restarting.~n"),
            register(translator, spawn_link(fun translate_service:loop/0)),
            loop()
    end.
