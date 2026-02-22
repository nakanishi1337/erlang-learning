-module(hello).

-export([hello/0]).

hello() ->
    io:format("Hello, Erlang!~n").

%% 実行方法:
%% cd /workspaces/erlang-learning/1_hello/
%% erlc hello.erl
%% erl -noshell -pa . -eval 'hello:hello(), halt().'
