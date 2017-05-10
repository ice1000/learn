(define (fib n) (cond
  ((= n 1) 1)
  ((= n 0) 1)
  (else (+ (fib (- n 1)) (fib (- n 2))))))

