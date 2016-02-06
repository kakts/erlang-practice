
-module(hello).
-export([add/2, hello/0, hello2/2, greet_and_add_two/1]).
%% add A to B
add(A, B) ->
	A + B.

%% print out
hello() ->
	io:format("hello world~n").

greet_and_add_two(X) ->
	hello(),
	add(X, 2).

%%
hello2(male, Name) ->
	io:format("Hello, Mr. ~s!", [Name]); % for male
hello2(female, Name) ->
	io:format("Hello, Mrs. ~s!", [Name]); % for female
hello2(_, Name) ->
	io:format("Hello, ~s!", [Name]). % for others.
