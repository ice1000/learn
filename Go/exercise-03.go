// Copyright 2009 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

package main

import (
	"fmt"
)

func fib(mem []int, n int) int {
	if n == 1 || n == 2 {
		return 1
	} else if mem[n] > 0 {
		return mem[n]
	} else {
		mem[n] = fib(mem, n - 1) + fib(mem, n - 2)
		return mem[n]
	}
}

func main() {
	mem := make([]int, 1000)
	fmt.Println(fib(mem, 500))
}
