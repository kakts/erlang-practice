
-module(hello).
-export([add/2, hello/0, greet_and_add_two/1]).
%% add A to B
add(A, B) ->
	A + B.

%% print out
hello() ->
	io:format("hello world~n").

%%
greet_and_add_two(X) ->
	hello(),
	add(X, 2).
