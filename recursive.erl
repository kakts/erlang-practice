%p57
-module(recursive).
-import(reverse, [reverse/1]).
-compile(export_all).

%% リストL　整数Nを受け取り、リストから最初のN個の要素のリストを返す
sublist(_, 0) -> []; % Nが0なら空リストを返す
sublist([], _) -> []; % 空リストを渡されたらカラリストを返す
sublist([H | T], N) when N > 0 -> [H | sublist(T, N - 1)].

%% 末尾再帰盤
tail_sublist(L, N) -> reverse:reverse(tail_sublist(L, N, [])).

tail_sublist(_, 0, Sublist) -> Sublist;
tail_sublist([], _, Sublist) -> Sublist;
tail_sublist([H | T], N, Sublist) when N > 0 ->
  tail_sublist(T, N-1, [H | Sublist]).


%% クイックソートの実装
quicksort([]) -> [];
quicksort([Pivot | Rest]) ->
  {Smaller, Larger} = partition(Pivot, Rest, [], []),
  quicksort(Smaller) ++ [Pivot] ++ quicksort(Larger).

%% クイックソート　大きい部分と小さい部分に分割する
partition(_, [], Smaller, Larger) -> {Smaller, Larger};
partition(Pivot, [H | T], Smaller, Larger) ->
  if H =< Pivot -> partition(Pivot, T, [H | Smaller], Larger);
     H > Pivot -> partition(Pivot, T, Smaller, [H | Larger])
  end.
