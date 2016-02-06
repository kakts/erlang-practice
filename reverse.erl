%p57.
-module(reverse).
-compile(export_all).

%% リストの中身を逆順にする
reverse([]) -> [];
reverse([H | T]) -> reverse(T) ++ [H].

%% 末尾再帰を使ったreverse
tail_reverse(L) -> tail_reverse(L, []).

tail_reverse([], Acc) -> Acc;
tail_reverse([H | T], Acc) -> tail_reverse(T, [H | Acc]).
