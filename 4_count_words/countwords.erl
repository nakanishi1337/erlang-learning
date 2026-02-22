-module(countwords).

-export([main/1, count_words/1]).

count_words(String) ->
    count_words(String, 0, false).

count_words([], Count, InWord) ->
    if InWord ->
           Count + 1;
       true ->
           Count
    end;
count_words([H | T], Count, InWord) ->
    case is_whitespace(H) of
        true ->
            if InWord ->
                   count_words(T, Count + 1, false);
               true ->
                   count_words(T, Count, false)
            end;
        false ->
            count_words(T, Count, true)
    end.

is_whitespace($ ) -> true;
is_whitespace(_) -> false.

main(String) ->
    Count = count_words(String),
    io:format("String: \"~s\"~n", [String]),
    io:format("Word count: ~w~n", [Count]).

%% 実行方法:
%% cd /workspaces/erlang-learning/4_count_words/
%% erlc countwords.erl
%% erl -noshell -pa . -eval 'countwords:main("Hello World Erlang"), halt().'
