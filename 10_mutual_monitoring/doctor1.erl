-module(doctor1).

-export([loop/0]).

loop() ->
    process_flag(trap_exit, true),
    receive
        {new, PeerPid, From} ->
            io:format("doctor1 started.~n"),
            register(doctor1, self()),
            link(PeerPid),
            From ! ok,
            monitor(PeerPid)
    end.

monitor(PeerPid) ->
    receive
        {'EXIT', PeerPid, Reason} ->
            io:format("doctor1 noticed doctor2 died with reason ~p.~n", [Reason]),
            io:format("Restarting doctor2.~n"),
            NewPeer = spawn(fun doctor2:loop/0),
            NewPeer ! {new, self(), self()},
            receive
                ok ->
                    ok
            end,
            link(NewPeer),
            monitor(NewPeer)
    end.
