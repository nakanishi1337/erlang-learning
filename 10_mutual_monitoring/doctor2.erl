-module(doctor2).

-export([loop/0]).

loop() ->
    process_flag(trap_exit, true),
    receive
        {new, PeerPid, From} ->
            io:format("doctor2 started.~n"),
            register(doctor2, self()),
            link(PeerPid),
            From ! ok,
            monitor(PeerPid)
    end.

monitor(PeerPid) ->
    receive
        {'EXIT', PeerPid, Reason} ->
            io:format("doctor2 noticed doctor1 died with reason ~p.~n", [Reason]),
            io:format("Restarting doctor1.~n"),
            NewPeer = spawn(fun doctor1:loop/0),
            NewPeer ! {new, self(), self()},
            receive
                ok ->
                    ok
            end,
            link(NewPeer),
            monitor(NewPeer)
    end.
