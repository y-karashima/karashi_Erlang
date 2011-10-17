-module(enum).
-export([test/0]).

-define(January, 1).
-define(February, 2).
-define(March, 3).
-define(April, 4).
-define(May, 5).
-define(June, 6).
-define(July, 7).
-define(August, 8).
-define(September, 9).
-define(Octorber, 10).
-define(November, 11).
-define(December, 12).

test() ->
  [?January, ?March].