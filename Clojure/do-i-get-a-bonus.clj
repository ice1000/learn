(ns clojure.bonus)

(defn bonus-time [salary bonus]
  (if bonus
    (clojure.string/join "" ["$", salary, "0"])
    (clojure.string/join "" ["$", salary])))
();
