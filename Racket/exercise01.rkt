#lang slideshow
; test comment
(define cir_a (circle 10))
(define rec_a (rectangle 30 10))
cir_a

;(hc-append (circle 10) (rectangle 10 20) (circle 10))
;(hb-append (circle 10) (rectangle 10 20) (circle 10))
(ht-append cir_a (rectangle 10 20) cir_a)
(htl-append cir_a (rectangle 10 20) cir_a)

; test comment
