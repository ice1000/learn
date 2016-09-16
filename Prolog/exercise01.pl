fib(1, 1).
fib(2, 1).
fib(N, Val) :- \+(N = 1), \+(N = 2), fib(N - 1, Val1), fib(N - 2, Val2), Val is Val1 + Val2.

