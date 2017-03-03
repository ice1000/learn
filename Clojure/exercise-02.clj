
; data class
; case class
(defrecord Book [title author])

(def sample (->Book "title" "author"))

(def pc (->Book "Programming Clojure" "Stuart Halloway"))

; strings
(def sicp
  (Book.
    "Structure and Interpretation of
     Computer Programs"
    "Harold Abelson"))

(def kia (->Book "Kotlin in Action" "JetBrains"))

; require a lib
(require '[clojure.string :as str])

;define a function
(defn indexed-word? [word]
  (> #(count %) 2))

; use function
(filter indexed-word? (str/split "My name is Van" #"\W+"))

; lambda expression
(filter #(> (count %) 2) (str/split "I'm an artist" #"\W+"))
