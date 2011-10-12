-module(echo). 
-export([start/0,print/1,stop/0]). 
-export([loop/0]).
 
start() -> 
  process_flag(trap_exit, true),
  Pid = spawn_link(echo, loop, []),
  register(echo, Pid), 
  {ok, Pid}. 

print(Message) -> 
  echo ! {print, Message}, 
  ok. 

stop() -> 
  echo ! stop, 
  ok. 

loop() -> 
  receive 
    {print, Message} -> 
      io:format("~w~n", [Message]), 
      loop(); 
    stop -> 
      exit(process_stoped)
  end. 