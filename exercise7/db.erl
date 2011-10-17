-module(db).

-export([new/0, destroy/1, write/3, delete/2, read/2, match/2]).
-record(data, {key, element}).

new() ->
  [].

destroy(_Db) ->
  ok.

write(Key, Element, Db) ->
  [#data{key = Key, element = Element} | delete(Key, Db)].

delete(_Key, []) ->
  [];
delete(Key, [#data{key = Key} | Tail]) ->
  delete(Key,Tail);
delete(Key, [Head|Tail]) ->
  [Head | delete(Key, Tail)].

read(_Key, []) ->
  {error, instance};
read(Key, [#data{key = Key, element = Element} | _]) ->
  {ok, Element};
read(Key, [_ | Tail]) ->
  read(Key, Tail).

match(_Element, []) ->
  [];
match(Element, [#data{key = Key, element = Element} | Tail]) ->
  [Key | match(Element, Tail)];
match(Element, [_ | Tail]) ->
  match(Element, Tail).