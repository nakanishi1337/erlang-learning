-module(list_and_function).

-export([lookup/2]).

lookup([{Keyword, Value} | _], Keyword) ->
    Value;
lookup([_ | Rest], Keyword) ->
    lookup(Rest, Keyword);
lookup([], _Keyword) ->
    not_found.

%% 実行方法:
%% cd /workspaces/erlang-learning/7_list_and_function/
%% erlc list_and_function.erl
%% erl -noshell -pa . -eval '
%%   List = [{"erlang", "a functional language"}, {ruby, "an OO language"}],
%%   Keywords = [ruby, "erlang", python],
%%   Values = lists:map(fun(Keyword) -> list_and_function:lookup(List, Keyword) end, Keywords),
%%   io:format("~p~n", [Values]),
%%   halt().
%% '
