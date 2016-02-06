-module(mod_test).
-export([do/1]).

do(Info) ->
	io:fwrite("mod_test ~s\n", [Info#mod.absolute_uri]),
	io:fwrite("mod_test :~s\n", [Info#mod.request_uri]),
	OldData = Info#mod.data,
	{proceed, OldData}.
