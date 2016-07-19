#lang racket

; 斐波那契数列
(define (fib a)
  (if (or (equal? a 1) (equal? a 2))
      1
      (+ (fib (- a 1)) (fib (- a 2)))))

(fib 1)
(fib 2)
(fib 3)
(fib 4)
(fib 5)
(fib 6)
