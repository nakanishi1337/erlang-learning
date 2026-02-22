-module(factorial).

-export([main/1, factorial/1]).

main(N) ->
    io:format("factorial(~w) = ~w~n", [N, factorial(N)]).

factorial(0) ->
    1;
factorial(N) ->
    N * factorial(N - 1).

%% 実行方法:
%% cd /workspaces/erlang-learning/2_factorial/
%% erlc factorial.erl
%% erl -noshell -pa . -eval 'factorial:main(5), halt().'
