; (require 'clojure.java.io)
(use 'clojure.java.io)

(def ice "boy next door")

(defn fuck
  "a function that prints a string, showing that a man is fucking a women\n"
  [man, women]
  (println man, " is fucking ", women))

(+ 1 1 1)

(- 10 1 2 3)

(* 10 1 2 34)

(* 10N 100 233 666 999 91308 9213890 198 890 890)

(/ 100 10 2)

(+ (+ 1 2 (* 12 2)))

(rem 22 7)

[\1 \2 \3 \a \b \c]

(concat [1 2] [3 4])

(if ()
  (println "fuck")
	(println "shit"))

(if 0
  (println "fuck")
	(println "shit"))

(if nil
  (println "fuck")
	(println "shit"))

(if (>= 10 12)
  (println "fuck")
	(println "shit"))


(def inventors
  {:Lisp "McCarthy",
	 :Clojure "Hickey",
	 :Lice "Tesla Ice Zhang"})

(inventors :Lice)
(inventors :Clojure)

(:Clojure inventors)
