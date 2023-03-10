%%%-------------------------------------------------------------------
%% @doc erlang_http_server public API
%% @end
%%%-------------------------------------------------------------------

-module(erlang_http_server_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    erlang_http_server_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
