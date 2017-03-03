(def r (new java.util.Random))

(println (. r nextInt))

(println (. r nextInt 10))

(println (. r nextLong))

(println (. r nextDouble))

(println (. r nextFloat))

; swing gui
(def s (new javax.swing.JFrame))

; displaying
(. s setVisible true)

; conjoin
(conj [1 2 3] :a)

(into [1 2 3] [:a :b :c])

; construct
(cons [1 2 3] :a)

; 0 -> 10
(range 10)

; 10 -> 20
(range 10 20)

; in chinese
; ji ou xing
(def parity [n]
  (loop [n n par 0]
    (if (= n 0)
      par
      (recur (dec n) (- 1 par)))))

; test
(map parity (range 100))

; trampoline
(declare ice-odd? ice-even?)

(defn ice-odd? [n]

  (if (= n 0)

    false

    #(ice-even? (dec n))))

(defn ice-even? [n]

  (if (= n 0)

    true

    #(ice-odd? (dec n))))

(println (trampoline ice-even? 10000))

(println (trampoline ice-odd? 123789))

(def deeply-nested [n]

  (loop [n n
         result '(bottom)]

    (if (= n 0)

      result

      (recur
        (dec n)
        (list result)))))

