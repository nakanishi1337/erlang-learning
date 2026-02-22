-module(countup).

-export([main/1, countup/1]).

countup(N) ->
    countup(1, N).

countup(Current, N) when Current > N ->
    done;
countup(Current, N) ->
    io:format("~w~n", [Current]),
    countup(Current + 1, N).

main(N) ->
    io:format("Counting from 1 to ~w:~n", [N]),
    countup(N),
    io:format("Done!~n", []).

%% 実行方法:
%% cd /workspaces/erlang-learning/5_countup/
%% erlc countup.erl
%% erl -noshell -pa . -eval 'countup:main(5), halt().'
