-module(erlang_http_server).
-export([start/1]).

start(Port) ->
    io:fwrite("Server Listening On http://localhost:~p/", [Port]),
    {ok, ListenSocket} = gen_tcp:listen(Port, [binary, {packet, 0}, {reuseaddr, true}, {active, true}]),
    loop(ListenSocket).

loop(ListenSocket) ->
    {ok, Socket} = gen_tcp:accept(ListenSocket),
    spawn(fun() -> handle_connection(Socket) end),
    loop(ListenSocket).

handle_connection(Socket) ->
    gen_tcp:send(Socket, "HTTP 1.1 200 OK\r\n\r\n\r\n<!DOCTYPE html><head><title>Erlang HTTP Server</title></head><body><h1>Hello, Erlang!</h1><br><a href='https://github.com/0xN1nja' target='_blank'>Abhimanyu Sharma</a></body></html>"),
    gen_tcp:close(Socket).
