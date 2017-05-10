#lang racket

; 笑死我了，圆面积，YMJ，真是个清新脱俗而又淡雅的好名字
(define (ymj r)
  (* 3.14159265358979323846263383279502884197
     (* r r)))

; 问候
(define (call c)
  (if (and (string? c)
           (> (string-length c) 5)
           (equal? (substring c 0 5) "Hello"))
      "Hi!\n"
      "I beg your pardon?\n"))

(display (call "Hello World\n"))
(display (call "Hi World\n"))

(define (judge score)
  (cond [(> score 100) "Error\n"]
        [(> score 90) "Awesome\n"]
        [(> score 80) "Nice\n"]
        [(> score 60) "Acceptable\n"]
        [else "Failed\n"]))

(define (print-score s)
  (display
   (format "~a's score is: ~a"
           s
           (judge s))))

(define AAA 98)
(print-score AAA)
(print-score 85)
(print-score 75)
(print-score 65)
(print-score 55)


; (error "java.lang.NullPointerException: in thread main")
