%% concurrent http client
-module(httpClient).
-compile(export_all).

%% Spawn new worker
%% @param Url - url
%% @param Manager
create_worker( Url, Manager ) ->
  spawn(?MODULE, worker, [ Url, Manager ]).

%% Send request
%% @param Url - url
%% @param Manager
worker( Url, Manager ) ->
  erlang:display(["starting worker", Url]),
  { Flag, Result } = http:request(Url), % HTTP get 発行
  case Flag of
    ok  -> { { _, Status, _ }, _, _ } = Result; % Fetch status
    error -> Status = Result
  end,
  Manager ! [ Url, Status ].    % Sent message to manager

create_manager() ->
 spawn(?MODULE, manager, []).

manager() ->
  receive
    % 受信したメッセージをパターンマッチ
    [ Url, Status ] -> io:format("~s is ~w~n", [ Url, Status ]),
              manager()      % loop
  end.

main( UrlList ) ->
  Manager = create_manager(),
  [ create_worker( Url, Manager ) || Url <- UrlList ].
