-module(records1).
-export([birthday/1, joe/0, showPerson/1, changeAddress/2]).

-record(person, {name, age=0, phone, address}).

birthday(#person{age = Age} = P) ->
  P#person{age = Age + 1}.

changeAddress(NewAddress, #person{address = _Address} = P) ->
  P#person{address = NewAddress}.

joe() ->
  #person{name = "joe",
          age = 21,
          phone = "123-4567",
          address = "Tamana"}.

showPerson(#person{age = Age, phone = Phone, name = Name, address = Address}) ->
  io:format("name: ~p age: ~p phone: ~p~n, address: ~p", [Name, Age, Phone, Address]).