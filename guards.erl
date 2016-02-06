-module(guards).
-compile(export_all).

%% 年齢判定
is_right_age(X) when X > 16, X =< 104 ->
  true;
is_right_age(_) ->
  false.
