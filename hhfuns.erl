%% 高階関数
-module(hhfuns).
-compile(export_all).

one() -> 1.
two() -> 2.

%% 配列の各要素をインクリメントする
increment([]) -> [];
increment([H | T]) -> [H + 1 | increment(T)].

%% 配列の各要素をデクリメントする
decrement([]) -> [];
decrement([H | T]) -> [H - 1 | decrement(T)].

add(X, Y) -> X() + Y().

map(_, []) -> [];
map(F, [H | T]) -> [F(H) | map(F, T)].
incr(X) -> X + 1.
decr(X) -> X - 1.
