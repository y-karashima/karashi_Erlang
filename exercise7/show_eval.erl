-module(show_eval).
-export([test/0]).

-ifdef(flag).
  -define(SHOW_EVAL(Call),io:format("~p = ~p~n",[??Call, Call])).
-else.
  -define(SHOW_EVAL(Call),io:format("~p~n",[Call])).
-endif.

test() ->
  ?SHOW_EVAL(length([1,2,3])).