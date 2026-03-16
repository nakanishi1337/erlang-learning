%% [{Item, Quantity, Price}] -> [{Item, TotalPrice}]
-module(list_comprehension).

-export([items_total_prices/1]).

items_total_prices(ShoppingList) ->
    [{Item, Quantity * Price} || {Item, Quantity, Price} <- ShoppingList].

%% 実行方法:
%% cd /workspaces/erlang-learning/8_list\ comprehension/
%% erlc list_comprehension.erl
%% erl -noshell -pa . -eval '
%%   ShoppingList = [{"apple", 2, 120}, {banana, 3, 80}],
%%   Result = list_comprehension:items_total_prices(ShoppingList),
%%   io:format("~p~n", [Result]),
%%   halt().
%% '
