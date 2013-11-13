-module(mimosa_app).

-behaviour(application).

-export([start/0]).

%% Application callbacks
-export([start/2, stop/1]).

start() ->
  application:start(compiler),
  application:start(syntax_tools),
  application:start(goldrush),
  application:start(lager),
  application:start(mimosa).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
  mimosa_sup:start_link().

stop(_State) ->
  ok.
