-module(recursiveFac).
-export([fac/1, tail_fac/1, duplicate/2, tail_duplicate/2]).

fac(N) when N == 0 -> 1;
fac(N) when N > 0 -> N*fac(N-1).

%$ 末尾再帰をつかったfacの改良
%% facと違いNのに関係なくメモリ使用量が常に一定になる
tail_fac(N) -> tail_fac(N, 1).

tail_fac(0, Acc) -> Acc;
tail_fac(N, Acc) when N > 0 -> tail_fac(N-1, N*Acc).


%% 指定した整数を複数回コピーしたリストを作る

%% 0回繰り返す = 空リストを返す
duplicate(0, _) ->
  [];
duplicate(N, Term) when N > 0 ->
  [Term | duplicate(N-1, Term)].

%% duplicateの末尾再帰版
tail_duplicate(N, Term) ->
  tail_duplicate(N, Term, []).

tail_duplicate(0, _, List) ->
  List;
tail_duplicate(N, Term, List) when N > 0 ->
  tail_duplicate(N-1, Term, [Term|List]).
