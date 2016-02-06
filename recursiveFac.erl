-module(recursiveFac).
-export([fac/1, tail_fac/1]).

fac(N) when N == 0 -> 1;
fac(N) when N > 0 -> N*fac(N-1).

%$ 末尾再帰をつかったfacの改良
%% facと違いNのに関係なくメモリ使用量が常に一定になる
tail_fac(N) -> tail_fac(N, 1).

tail_fac(0, Acc) -> Acc;
tail_fac(N, Acc) when N > 0 -> tail_fac(N-1, N*Acc).
