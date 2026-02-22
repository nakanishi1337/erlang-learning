-module(is_success).

-export([process_result/1, main/0]).

process_result(success) ->
    "success";
process_result({error, Message}) ->
    "error:" ++ Message.

main() ->
    io:format("~s~n", [process_result(success)]),
    io:format("~s~n", [process_result({error, "file not found"})]),
    io:format("~s~n", [process_result({error, "network timeout"})]).

%% 実行方法:
%% cd /workspaces/erlang-learning/6_is_success/
%% erlc is_success.erl
%% erl -noshell -pa . -eval 'is_success:main(), halt().'
