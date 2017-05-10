#lang slideshow
(define c (circle 10))
(define (square size)
  (rectangle size size))

(square 10)
(square 10)
(square 10)

(define (lope length)
  (let ([round (circle length)]
        [squ (square length)])
  (hc-append 4 round squ round squ)))

(lope 30)

(let ([A (square 10)]
      [B (circle 10)])
  (hc-append A B))

(display 233)

(define (fopen name)
  (open-output-file name))

(display "Hello World" (fopen "out.txt"))
; (close-output-port (fopen "out.txt"))
