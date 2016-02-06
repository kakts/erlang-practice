-module(cases).
-compile(export_all).
insert(X, []) ->
  [X];
insert(X, Set) ->
  case lists:member(X, Set) of
    true -> Set; % 含まれていたらSetを返す
    false -> [X | Set] % XをSetに追加する
 end.

beach(Temperature) ->
  case Temperature of
    {celsius, N} when N >= 20, N =< 45 ->
      'favorable';
    {kelvin, N} when N >= 293, N =< 318 ->
      'scientifically favorable';
    {fahrenheit, N} when N >= 68, N =< 113 ->
      'favorable in the US';
    _ ->
      'avoid beach'
  end.
  
