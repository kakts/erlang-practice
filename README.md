# erlang-practise

## How to use it.
### Installing erlang(for mac)
$ brew install erlang

### Compile .erm file
$ erl  
1> c(hello).  // compiling hello module.
{ok,hello}  

### Use hello() function
2> hello:hello().  
hello world
