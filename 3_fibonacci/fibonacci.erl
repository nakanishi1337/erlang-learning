-module(fibonacci).

-export([main/1, fibonacci/1]).

main(N) ->
    io:format("fibonacci(~w) = ~w~n", [N, fibonacci(N)]).

fibonacci(0) ->
    0;
fibonacci(1) ->
    1;
fibonacci(N) ->
    fibonacci(N - 1) + fibonacci(N - 2).

%% 実行方法:
%% cd /workspaces/erlang-learning/3_fibonacci/
%% erlc fibonacci.erl
%% erl -noshell -pa . -eval 'fibonacci:main(10), halt().'
