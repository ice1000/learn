package main

import (
	"fmt"
)

var mem []uint64 = make([]uint64, 10000)

func fib(n int) uint64 {
	if n <= 0 {
		return 0
	} else if n == 1 || n == 2 {
		return 1
	} else if mem[n] != 0 {
		return mem[n]
	} else {
		mem[n] = fib(n - 1) + fib(n - 2)
		return mem[n]
	}
}

func main() {
	for i := 1; i < 80; i++ {
		fmt.Println(
			fib(i))
	}
}
