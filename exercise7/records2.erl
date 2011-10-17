-module(records2).
-export([culcCircumference/1, culcArea/1]).

-record(circle, {radius}).
-record(square, {length, width}).
-record(triangle, {side1, side2, side3}).

culcCircumference(#circle{radius = Radius}) ->
  Radius * 2 * math:pi();
culcCircumference(#square{length = Length, width = Width}) ->
  (Length * 2) + (Width * 2);
culcCircumference(#triangle{side1 = Side1, side2 = Side2, side3 = Side3}) ->
  Side1 + Side2 + Side3.

culcArea(#circle{radius = Radius}) ->
  Radius * Radius * math:pi();
culcArea(#square{length = Length, width = Width}) ->
  Length * Width;
culcArea(#triangle{side1 = Side1, side2 = Side2, side3 = Side3}) ->
  S = (Side1 + Side2 + Side3) / 2,
  math:sqrt(S*(S - Side1)*(S - Side2)*(S - Side3)).
